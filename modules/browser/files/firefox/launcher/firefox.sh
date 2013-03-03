#!/usr/bin/env bash

while [ ! -f "$HOME/.sync-decrypt/.mounted" ]; do
	sleep 1
done

if [ "$(expr "$RANDOM" % 100)" -eq 0 ]; then
	profile-cleaner f
fi

exec /usr/lib/firefox/firefox "$@"
