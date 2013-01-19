class browser::firefox::duckduckgo {
	firefox_pref {'browser.search.selectedEngine':
		value => 'DuckDuckGo'
	}
	# TODO: Find way to install duckduckgo search engine
}