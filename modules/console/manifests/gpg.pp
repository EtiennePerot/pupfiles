class console::gpg {
	enduser_file {'.gnupg/gpg.conf':
		source => 'console/gpg'
	}

	include private::console::gpg
	# I do not want to reveal my list of GPG keys.
	# For reference though, it's basically a list of blocks that look like the following:
	#gpg_key {'etienne/user@hostname':
	#	source => 'console/gpg/user.asc',
	#	user => 'etienne'
	#}
}