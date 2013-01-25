#!/usr/bin/env bash

while [ ! -f "$HOME/.sync-decrypt/.mounted" ]; do
	sleep 1
done

exec /usr/lib/firefox/firefox "$@"
