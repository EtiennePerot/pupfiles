#!/usr/bin/env bash

scriptDir=$(dirname "$BASH_SOURCE")
scriptDir=$(cd "$scriptDir/.." && pwd)

if [ ! -x "$scriptDir/setup.sh" ]; then
	echo 'Cannot find setup.sh. Aborting.' >&2
	exit 1
fi
export PUP_JUST_SET_VARIABLES='true'
source "$scriptDir/setup.sh"
unset PUP_JUST_SET_VARIABLES
if [ ! -f this.manifest ]; then
	echo 'Cannot find this.manifest. Make sure everything is set up properly first.' >&2
	exit 1
fi
read chosenManifest < this.manifest
modulePath="$pupDir/private/modules:$pupDir/modules:`puppet apply --configprint modulepath`"
exec puppet apply --modulepath "$modulePath" "manifests/$chosenManifest.pp"
