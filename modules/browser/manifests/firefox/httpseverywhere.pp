class browser::firefox::httpseverywhere {
	# If there's one entity I trust, it's the EFF
	firefox_pref {'extensions.https_everywhere._observatory.enabled':
		value => true
	}
	firefox_pref {'extensions.https_everywhere._observatory.popup_shown':
		value => true
	}
	firefox_pref {'extensions.https_everywhere._observatory.alt_roots':
		value => true
	}
}