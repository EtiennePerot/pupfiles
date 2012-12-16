class console::pager {
	package {'most':}
	enduser_file {'.terminfo':
		ensure => directory,
		recurse => true,
		source => 'console/pager',
		require => Package['most']
	}
}