class browser::firefox::cookiewhitelistwithbuttons { # What a terrible name
	firefox_pref {'extensions.cwwb.accept_third_party':
		value => false,
		isdefault => true
	}
	firefox_pref {'extensions.cwwb.record_button_startup':
		# Do not reset cookie management preference on startup
		value => 2
	}
	firefox_pref {'extensions.cwwb.remove_www':
		value => true
	}
	firefox_pref {'extensions.cwwb.select_subdomain':
		value => true
	}
}