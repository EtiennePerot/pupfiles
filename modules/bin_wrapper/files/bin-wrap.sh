#!/bin/bash

if [ -z "$1" ]; then
	exit 1
fi

currentProgram="$(echo "$1" | sed -r 's#^/etc/bin-wrappers/##')"

chosenProgram="$(which --all --skip-alias --skip-functions -- "$currentProgram" | grep -viE '/etc/bin-wrappers/' | head -1)"

if [ -z "$chosenProgram" ]; then
	exit 2
fi

shift
if [ -z "$BINWRAPPER_PREFIX" ]; then
	exec "$chosenProgram" "$@"
else
	exec $BINWRAPPER_PREFIX "$chosenProgram" "$@"
fi
