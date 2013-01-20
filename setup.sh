#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
	echo 'Run me as root.' >&2
	exit 1
fi

pupUrl=git://perot.me/pupfiles
pupDir=/var/lib/pupfiles
pupPrivateUrlInitial=git://perot.me/pupfiles-private
pupPrivateUrlActual=git@perot.me:pupfiles-private

scriptDir=$(dirname "$BASH_SOURCE")
scriptDir=$(cd "$scriptDir" && pwd)
if [ -d "$scriptDir/manifests" ]; then
	pupDir="$scriptDir"
fi

if [ -n "$PUP_JUST_SET_VARIABLES" ]; then
	return
fi

setterm -blength 0

if ! pacman -Q puppet &> /dev/null; then
	if ! grep '\[archlinuxfr\]' /etc/pacman.conf &> /dev/null; then
		echo >> /etc/pacman.conf # Empty line
		echo '[archlinuxfr]' >> /etc/pacman.conf
		echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf
	fi
	if ! pacman -Q yaourt &> /dev/null; then
		pacman -Sy --noconfirm yaourt || exit 1
	fi
	yaourt -Sya --noconfirm puppet || exit 1
fi
getpackages() {
	for package; do
		if ! puppet resource package "$package" ensure=installed &> /dev/null; then
			echo "Puppet failed to make sure we have $package." >&2
			exit 1
		fi
	done
}
getpackages openssh git scrypt python python2 python-scrypt
if [ ! -d "$pupDir" ]; then
	mkdir -p "$pupDir"
	if ! git clone --recursive "$pupUrl" "$pupDir"; then
		rm -rf "$pupDir"
		exit 1
	fi
else
	cd "$pupDir"
	if ! git pull &> /dev/null; then
		echo 'Could not update main repository.'
		exit 1
	fi
fi
cd "$pupDir"
if [ ! -f private/ssh.key ]; then
	# If we don't have the appropriate ssh key to the private pupfiles repo,
	# then remove any leftover private stuff
	rm -rf private.key private encrypted-private
fi
if [ ! -d encrypted-private ]; then
	fullPrivateCheckout='true'
	while [ -n "$fullPrivateCheckout" ]; do
		echo 'Open the floodgates and press Enter.'
		read
		if git clone --recursive "$pupPrivateUrlInitial" encrypted-private; then
			fullPrivateCheckout=''
			cd encrypted-private
			git remote set-url origin "$pupPrivateUrlActual"
			cd ..
			chmod -R g-rwx,o-rwx encrypted-private
			echo 'Close the floodgates and press Enter.'
			read
		else
			rm -rf encrypted-private
		fi
	done
else
	cd encrypted-private
	export GIT_SSH="$pupDir/util/git-ssh-private.sh"
	if ! git pull &> /dev/null; then
		echo 'Could not update encrypted-private repository.'
		exit 1
	fi
	unset GIT_SSH
	cd ..
fi
mkdir -p private
decryptionKey=''
if [ ! -f private.key ]; then
	echo -n 'Enter decryption key: '
	read decryptionKey
	echo "$decryptionKey" > private.key
fi
while IFS= read -d $'\0' -r encryptedFile; do
	file=$(echo "$encryptedFile" | sed 's#^encrypted-private/*##')
	decryptedFile="private/$file"
	if [ -d "$encryptedFile" ]; then
		mkdir -p "$decryptedFile"
	elif [ -f "$encryptedFile" ]; then
		if [ ! -f "$decryptedFile" -o "$encryptedFile" -nt "$decryptedFile" ]; then
			echo "Decrypting $encryptedFile..."
			if ! ./util/decrypt-scrypt.py "$decryptedFile" "$encryptedFile" < private.key; then
				echo 'Invalid decryption key.'
				rm private.key
				exit 1
			fi
		fi
	else
		echo "Irregular file $encryptedFile, aborting."
		exit 1
	fi
done < <(find encrypted-private -name .git -prune -o -print0)
while IFS= read -d $'\0' -r decryptedFile; do
	file=$(echo "$decryptedFile" | sed 's#^private/*##')
	encryptedFile="encrypted-private/$file"
	if [ ! -e "$encryptedFile" ]; then
		rm -rf "$decryptedFile"
	fi
done < <(find private -print0)
chmod -R g-rwx,o-rwx private
cd "$pupDir"
chosenManifest=$(hostname | tr '[:upper:]' '[:lower:]')
if [ -f this.manifest ]; then
	read chosenManifest < this.manifest
fi
while [ ! -f "manifests/$chosenManifest.pp" ]; do
	echo 'Which one are you?'
	while IFS= read -d $'\0' -r manifest; do
		echo "  > $manifest" | sed 's#manifests/##' | sed 's/\.pp$//i'
	done < <(find manifests -type f -name '*.pp' -print0)
	echo -n 'Selection: '
	read chosenManifest
	echo "$chosenManifest" > this.manifest
done
modulePath="$pupDir/private/modules:$pupDir/modules:`puppet apply --configprint modulepath`"
if [ -f "private/manifests/$chosenManifest.pp" ]; then
	cat "manifests/$chosenManifest.pp" "private/manifests/$chosenManifest.pp" > "manifests/.$chosenManifest.gen.pp"
else
	cp "manifests/$chosenManifest.pp" "manifests/.$chosenManifest.gen.pp"
fi
export FACTERLIB="$pupDir/facter"
exec puppet apply --modulepath "$modulePath" "manifests/.$chosenManifest.gen.pp"
