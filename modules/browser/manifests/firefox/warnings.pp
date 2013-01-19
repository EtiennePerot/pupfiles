class browser::firefox::warnings {
	firefox_pref {'browser.tabs.warnOnClose':
		value => false
	}
}