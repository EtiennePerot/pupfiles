class browser::firefox::profile (
	$profile = 'Default',
	$profilenumber = 0,
	$default = 1
) {
	enduser_file {'.mozilla':
		ensure => directory
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
	enduser_file {".mozilla/firefox/$profile":
		ensure => directory
	}
	enduser_file {".mozilla/firefox/$profile/user.js":}
	$section = "Profile$profilenumber"
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