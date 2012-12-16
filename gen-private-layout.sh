#!/usr/bin/env bash

scriptDir=$(dirname "$BASH_SOURCE")
cd "$scriptDir"
find private -type f | sort > private-layout.txt
