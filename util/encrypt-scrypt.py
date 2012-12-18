#!/usr/bin/env python2

# Dirty script that encrypts a file with scrypt
# Usage: encrypt-scrypt.py maxtime maxmem rawfile encfile (specify passphrase on stdin)

import sys, hashlib, scrypt

if len(sys.argv) != 5:
	sys.stderr.write('Wrong usage.\n')
	sys.exit(1)

# Could use a proper key derivation function here, but it's redundant because
# scrypt does its own key derivation. One might argue that this makes the
# sha512() redundant, and they would be right.
passphrase = hashlib.sha512(sys.stdin.read(-1).strip() + sys.argv[3]).hexdigest()

rawcontents = open(sys.argv[3], 'rb').read(-1)

encrypted = scrypt.encrypt(rawcontents, passphrase, maxtime=int(sys.argv[1]), maxmem=int(sys.argv[2]))

output = open(sys.argv[4], 'wb')
output.write(encrypted)
output.close()