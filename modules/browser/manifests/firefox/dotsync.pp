class browser::firefox::dotsync (
	$profile = 'Default',
) {
	require browser::firefox::profile
	enduser_file {".mozilla/firefox/$profile/HTTPSEverywhereUserRules":
		ensure => link,
		target => '.sync-decrypt/firefox/HTTPSEverywhereUserRules',
		absolutetarget => false,
		noroot => true
	}
	enduser_file {".mozilla/firefox/$profile/gm_scripts":
		ensure => link,
		target => '.sync-decrypt/firefox/gm_scripts',
		absolutetarget => false,
		noroot => true
	}
	enduser_file {".mozilla/firefox/$profile/searchplugins":
		ensure => link,
		target => '.sync-decrypt/firefox/searchplugins',
		absolutetarget => false,
		noroot => true
	}
	enduser_file {".mozilla/firefox/$profile/stylish.sqlite":
		ensure => link,
		target => '.sync-decrypt/firefox/stylish.sqlite',
		absolutetarget => false,
		noroot => true
	}
}