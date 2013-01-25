class browser::firefox::flashblock {
	firefox_pref {'flashblock.silverlight.blocked':
		value => true
	}
	firefox_pref {'services.sync.prefs.sync.flashblock.whitelist':
		value => true
	}
}