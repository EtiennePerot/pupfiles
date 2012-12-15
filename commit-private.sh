#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
	echo 'Run me as root.' >&2
	exit 1
fi

cd $(dirname "$BASH_SOURCE")

if [ ! -f private.key -o ! -d private -o ! -d encrypted-private ]; then
	echo 'Must be properly set up first.'
	exit 1
fi

encryptfile() {
	read encryptionKey < private.key
	openssl enc -aes-256-cbc -in "$1" -out "$2" -pass "pass:$encryptionKey"
	return "$?"
}
export GIT_ROOT="$(pwd)/encrypted-private"
while IFS= read -d $'\0' -r decryptedFile; do
	file=$(echo "$decryptedFile" | sed 's#^private/*##')
	encryptedFile="encrypted-private/$file"
	if [ -d "$decryptedFile" ]; then
		mkdir -p "$encryptedFile"
		cd encrypted-private
		git add "$file"
		cd ..
	elif [ -f "$decryptedFile" ]; then
		if [ ! -f "$encryptedFile" -o "$decryptedFile" -nt "$encryptedFile" ]; then
			echo "+ $file"
			if encryptfile "$decryptedFile" "$encryptedFile"; then
				cd encrypted-private
				git add "$file"
				cd ..
			fi
		fi
	else
		echo "Irregular file $decryptedFile, aborting."
		exit 1
	fi
done < <(find private -print0)
while IFS= read -d $'\0' -r encryptedFile; do
	file=$(echo "$encryptedFile" | sed 's#^encrypted-private/*##')
	decryptedFile="private/$file"
	if [ ! -e "$decryptedFile" ]; then
		cd encrypted-private
		git rm -rfq --ignore-unmatch "$file"
		echo "- $file"
		cd ..
	fi
done < <(find encrypted-private -name .git -prune -o -print0)
chmod -R g-rwx,o-rwx private encrypted-private
cd encrypted-private
if git diff --staged --exit-code &> /dev/null; then
	echo 'No changes.'
else
	echo 'Ready to commit.'
fi
