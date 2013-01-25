class browser::firefox::profile (
	$profile = 'Default',
	$profilenumber = 0,
	$default = 1
) {
	enduser_file {'.mozilla':
		ensure => directory,
		mode => 0644
	}
	enduser_file {'.mozilla/firefox':
		ensure => directory,
		mode => 0644
	}
	enduser_file::ini {'.mozilla/firefox/profiles.ini/General/StartWithLastProfile':
		filename => '.mozilla/firefox/profiles.ini',
		section => 'General',
		setting => 'StartWithLastProfile',
		value => 1,
		mode => 0644
	}
	enduser_file {".mozilla/firefox/$profile":
		ensure => directory,
		mode => 0644
	}
	enduser_file {".mozilla/firefox/$profile/user.js":
		mode => 0644
	}
	$section = "Profile$profilenumber"
	enduser_file::ini {".mozilla/firefox/profiles.ini/$section/Name":
		filename => '.mozilla/firefox/profiles.ini',
		section => $section,
		setting => 'Name',
		value => $profile,
		mode => 0644
	}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$section/IsRelative":
		filename => '.mozilla/firefox/profiles.ini',
		section => $section,
		setting => 'IsRelative',
		value => 1,
		mode => 0644
	}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$section/Path":
		filename => '.mozilla/firefox/profiles.ini',
		section => $section,
		setting => 'Path',
		value => $profile,
		mode => 0644
	}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$section/Default":
		filename => '.mozilla/firefox/profiles.ini',
		section => $section,
		setting => 'Default',
		value => $default,
		mode => 0644
	}
}