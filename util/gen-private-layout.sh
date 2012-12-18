#!/usr/bin/env bash

scriptDir=$(dirname "$BASH_SOURCE")
cd "$scriptDir/.."
layout=$(find private -path '*/console/gpg/*.asc' -prune -o -type f -print)
layout="$layout
private/modules/private/templates/console/gpg/*.asc"
layout=$(echo "$layout" | sed -r 's#([^/]+)@([^./]+)\.([^./]+)#\1 (at) \2 (dot) \3#g')
echo "$layout" | sort > private-layout.txt
