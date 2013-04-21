#!/bin/bash

stubDir="$1"
if [ ! -d "$stubDir" ]; then
	exit 1
fi
exec chown -R "$(stat -c '%U:%G' "$stubDir")" "$stubDir"
