#!/usr/bin/env bash

SYNERGY_SERVER='%SYNERGY_SERVER%'
SYNERGY_NODE='%SYNERGY_NODE%'

exec synergyc --daemon --restart --no-tray --name "$SYNERGY_NODE" "$SYNERGY_SERVER"
