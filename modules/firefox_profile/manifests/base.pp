class firefox_profile::base {
	package {'firefox':}
	enduser_file {'.mozilla':
		ensure => directory,
		require => Package['firefox']
	}
	enduser_file {'.mozilla/firefox':
		ensure => directory
	}
	enduser_file::ini {'.mozilla/firefox/profiles.ini/General/StartWithLastProfile':
		filename => '.mozilla/firefox/profiles.ini',
		section => 'General',
		setting => 'StartWithLastProfile',
		value => 1
	}
}