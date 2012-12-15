#!/usr/bin/env bash

scriptDir=$(dirname "$BASH_SOURCE")
scriptDir=$(cd "$scriptDir" && pwd)

if [ ! -x "$scriptDir/setup.sh" ]; then
	echo 'Cannot find setup.sh. Aborting.' >&2
	exit 1
fi
export PUP_JUST_SET_VARIABLES='true'
source "$scriptDir/setup.sh"
unset PUP_JUST_SET_VARIABLES
exec ssh -i "$pupDir/private/ssh.key" "$@"
