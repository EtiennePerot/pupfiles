class console::pager {
	package {'most':}
	enduser_file {'.terminfo':
		ensure => directory,
		recurse => true,
		source => 'puppet:///modules/console/pager/.terminfo',
		require => Package['most']
	}
}