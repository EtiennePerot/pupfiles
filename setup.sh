#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
	echo 'Run me as root.' >&2
	exit 1
fi
setterm -blength 0

pupUrl=git://perot.me/pupfiles
pupDir=/var/lib/pupfiles
pupPrivateUrlInitial=git://perot.me/pupfiles-private
pupPrivateUrlActual=git@perot.me:pupfiles-private

scriptDir=$(dirname "$BASH_SOURCE")
scriptDir=$(cd "$scriptDir" && pwd)
if [ -d "$scriptDir/manifests" ]; then
	pupDir="$scriptDir"
fi

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
getpackages openssh openssl git
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
	if ! git pull &> /dev/null; then
		echo 'Could not update encrypted-private repository.'
		exit 1
	fi
	cd ..
fi
mkdir -p private
decryptionKey=''
if [ ! -f private.key ]; then
	echo -n 'Enter decryption key: '
	read decryptionKey
	echo "$decryptionKey" > private.key
else
	read decryptionKey < private.key
fi
while IFS= read -d $'\0' -r encryptedFile; do
	file=$(echo "$encryptedFile" | sed 's#^encrypted-private/*##')
	decryptedFile="private/$file"
	if [ -d "$encryptedFile" ]; then
		mkdir -p "$decryptedFile"
	elif [ -f "$encryptedFile" ]; then
		if [ ! -f "$decryptedFile" -o "$encryptedFile" -nt "$decryptedFile" ]; then
			if ! openssl enc -d -aes-256-cbc -in "$encryptedFile" -out "$decryptedFile" -pass "pass:$decryptionKey"; then
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
chosenManifest=$(hostname)
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
puppet apply --modulepath "$modulePath" "manifests/$chosenManifest.pp"
