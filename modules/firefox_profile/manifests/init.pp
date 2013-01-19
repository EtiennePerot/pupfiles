define firefox_profile (
	$profile = $name,
	$default = 0
) {
	require firefox_profile::base
	enduser_file {".mozilla/firefox/$profile":
		ensure => directory
	}
	enduser_file {".mozilla/firefox/$profile/prefs.js":}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$profile/Name":
		filename => '.mozilla/firefox/profiles.ini',
		section => $profile,
		setting => 'Name',
		value => $profile
	}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$profile/IsRelative":
		filename => '.mozilla/firefox/profiles.ini',
		section => $profile,
		setting => 'IsRelative',
		value => 1
	}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$profile/Path":
		filename => '.mozilla/firefox/profiles.ini',
		section => $profile,
		setting => 'Path',
		value => $profile
	}
	enduser_file::ini {".mozilla/firefox/profiles.ini/$profile/Default":
		filename => '.mozilla/firefox/profiles.ini',
		section => $profile,
		setting => 'Default',
		value => $default
	}
}