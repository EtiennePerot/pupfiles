class browser::firefox::flashblock {
	firefox_pref {'flashblock.silverlight.blocked':
		value => true
	}
	firefox_pref {'flashblock.whitelist':
		value => template('browser/firefox/flashblock/whitelist.txt')
	}
}