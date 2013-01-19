class browser::firefox::profile (
	$profile = 'Default',
	$profilenumber = 0,
	$default = 1
) {
	enduser_file {'.mozilla':
		ensure => directory,
		require => Package['firefox']
	}
	enduser_file {'.mozilla/firefox':
		ensure => directory
	}
	enduser_file {'.mozilla/profiles.ini':
		mode => 0644 # Firefox chmods it to that on startup
	}
	enduser_file::ini {'.mozilla/firefox/profiles.ini/General/StartWithLastProfile':
		filename => '.mozilla/firefox/profiles.ini',
		section => 'General',
		setting => 'StartWithLastProfile',
		value => 1
	}
	enduser_file {".mozilla/firefox/$profile":
		ensure => directory
	}
	$section = "Profile$profilenumber"
	enduser_file {".mozilla/firefox/$profile/prefs.js":}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$section/Name":
		filename => '.mozilla/firefox/profiles.ini',
		section => $section,
		setting => 'Name',
		value => $profile
	}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$section/IsRelative":
		filename => '.mozilla/firefox/profiles.ini',
		section => $section,
		setting => 'IsRelative',
		value => 1
	}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$section/Path":
		filename => '.mozilla/firefox/profiles.ini',
		section => $section,
		setting => 'Path',
		value => $profile
	}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$section/Default":
		filename => '.mozilla/firefox/profiles.ini',
		section => $section,
		setting => 'Default',
		value => $default
	}
}