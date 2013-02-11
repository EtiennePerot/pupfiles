#!/usr/bin/env bash

ignoredPatterns=(
	'private/modules/private/templates/console/gpg/*.asc'
	'private/modules/private/files/desktop/wallpapers/*'
)

scriptDir=$(dirname "$BASH_SOURCE")
cd "$scriptDir/.."
findArguments=()
layoutExtra=''
for pattern in "${ignoredPatterns[@]}"; do
	findArguments+=(-path "$pattern" -prune -o)
	layoutExtra="$layoutExtra
$pattern"
done
layout=$(find private "${findArguments[@]}" -type f -print)
layout="$layout
$layoutExtra"
layout=$(echo "$layout" | sed -r 's#([^/]+)@([^./]+)\.([^./]+)#\1 (at) \2 (dot) \3#g')
echo "$layout" | sort | grep . > private-layout.txt
