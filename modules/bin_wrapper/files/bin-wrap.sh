#!/bin/bash

BINWRAPPER_ROOT='/etc/bin-wrappers'

if [ -z "$BINWRAPPER_WRAPPEDBINARY" ]; then
	if [ -z "$1" ]; then
		exit 1
	fi
	currentProgram="$(echo "$1" | sed -r "s#^$BINWRAPPER_ROOT/##")"
	chosenProgram="$(which --all --skip-alias --skip-functions -- "$currentProgram" | grep -vE "^$BINWRAPPER_ROOT/" | head -1)"
	if [ -z "$chosenProgram" ]; then
		exit 2
	fi
else
	chosenProgram="$BINWRAPPER_WRAPPEDBINARY"
fi
export PATH="$(echo "$PATH" | sed -r "s#:$BINWRAPPER_ROOT/*|$BINWRAPPER_ROOT/*:##g")"
shift
if [ -n "$BINWRAPPER_EXEC_BEFORE" ]; then
	bash -c "$BINWRAPPER_EXEC_BEFORE" &> /dev/null
fi
if [ -n "$BINWRAPPER_EXEC_AFTER" ]; then
	returnCode=''
	if [ -z "$BINWRAPPER_PREFIX" ]; then
		"$chosenProgram" "$@"
		returnCode="$?"
	else
		$BINWRAPPER_PREFIX "$chosenProgram" "$@"
		returnCode="$?"
	fi
	bash -c "$BINWRAPPER_EXEC_AFTER" &> /dev/null
	exit "$returnCode"
else
	if [ -z "$BINWRAPPER_PREFIX" ]; then
		exec "$chosenProgram" "$@"
	else
		exec $BINWRAPPER_PREFIX "$chosenProgram" "$@"
	fi
fi
