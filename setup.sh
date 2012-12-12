#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
	echo 'Run me as root.' >&2
	exit 1
fi

pupUrl=git://perot.me/pupfiles
pupDir=/var/lib/pupfiles

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
if ! puppet resource package git ensure=installed &> /dev/null; then
	echo 'Puppet failed to make sure we have git.' >&2
	exit 1
fi
if [ ! -d "$pupDir" ]; then
	mkdir -p "$pupDir"
	if ! git clone "$pupUrl" "$pupDir"; then
		rm -rf "$pupDir"
		exit 1
	fi
else
	cd "$pupDir"
	git pull || exit 1
fi
cd "$pupDir"
chosenManifest='null'
if [ -f this.manifest ]; then
	read chosenManifest < this.manifest
fi
while [ ! -f "manifests/$chosenManifest.pp" ]; do
	echo 'Which one are you?'
	while IFS= read -d $'\0' -r manifest; do
		echo "  > $manifest" | sed 's/manifests\///' | sed 's/\.pp$//i'
	done < <(find manifests -type f -name '*.pp' -print0)
	read chosenManifest
	echo "$chosenManifest" > this.manifest
done
modulePath="`puppet apply --configprint modulepath`:$pupDir/modules"
puppet apply --modulepath "$modulePath" "manifests/$chosenManifest.pp"
