class browser::firefox::betterprivacy {
	firefox_pref {'extensions.bprivacy.donotaskonexit':
		value => true
	}
}