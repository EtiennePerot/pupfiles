class browser::firefox::duckduckgo {
	firefox_pref {'browser.search.selectedEngine':
		value => 'DuckDuckGo'
	}
	firefox_pref {'keyword.URL':
		value => 'https://duckduckgo.com/?q='
	}
}