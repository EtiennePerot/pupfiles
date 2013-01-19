class browser::firefox::nonewtabpage {
	firefox_pref {'browser.newtabpage.enabled':
		value => false
	}
}