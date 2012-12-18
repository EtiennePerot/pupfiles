class gpg_key::base {
	package {'gnupg':}
	enduser_file {'.gnupg':
		ensure => directory,
		require => Package['gnupg']
	}
}