class browser::firefox::duckduckgo {
	firefox_pref {'browser.search.selectedEngine':
		value => 'DuckDuckGo'
	}
}