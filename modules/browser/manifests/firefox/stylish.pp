class browser::firefox::stylish {
	firefox_pref {'extensions.stylish.firstRun':
		value => 3
	}
}