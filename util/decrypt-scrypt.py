#!/usr/bin/env python2

# Dirty script that decrypts a file with scrypt
# Usage: decrypt-scrypt.py rawfile encfile (specify passphrase on stdin)

import sys, hashlib, scrypt

if len(sys.argv) != 3:
	sys.stderr.write('Wrong usage.\n')
	sys.exit(1)

# Could use a proper key derivation function here, but it's redundant because
# scrypt does its own key derivation. One might argue that this makes the
# sha512() redundant, and they would be right.
passphrase = hashlib.sha512(sys.stdin.read(-1).strip() + sys.argv[1]).hexdigest()

enccontents = open(sys.argv[2], 'rb').read(-1)

decrypted = scrypt.decrypt(enccontents, passphrase)

output = open(sys.argv[1], 'wb')
output.write(decrypted)
output.close()