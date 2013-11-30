#!/bin/bash

binWrappersRoot='/etc/bin-wrappers'
binDirectories="$binWrappersRoot/.wrapped-binaries"

shopt -u dotglob
for binaryToWrap in "$binWrappersRoot"/*; do
	binaryToWrap="$(echo "$binaryToWrap" | sed "s#^$binWrappersRoot/##")"
	echo "> Wrapping '$binaryToWrap'..."
	while IFS= read -d $'\n' -r program; do
		echo "    > Wrapping '$binaryToWrap' at '$program'..."
		binName="$binDirectories/$(echo "$program" | sed -e 's#^/*##' -e 's#/#.#g')"
		if [ -h "$program" ]; then
			ln -s "$(readlink -e "$program")" "$binName"
			rm "$program"
		elif ! grep -qE '^# THIS_IS_A_BINWRAPPER_SCRIPT' "$program"; then
			mv "$program" "$binName"
		else
			continue # No need to rewrite anything
		fi
		echo '#!/bin/bash' > "$program"
		echo '# THIS_IS_A_BINWRAPPER_SCRIPT' >> "$program"
		echo "export BINWRAPPER_WRAPPEDBINARY='$binName'" >> "$program"
		echo "exec '$binWrappersRoot/$binaryToWrap' \"\$@\"" >> "$program"
		chmod --reference="$binName" "$program"
		chmod go-w "$program"
		chown --reference="$binName" "$program"
	done < <(which --all --skip-alias --skip-functions -- "$binaryToWrap" | grep -vE '^/etc/bin-wrappers/')
done
