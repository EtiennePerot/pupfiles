class browser::firefox::fonts {
	require desktop::fonts
	firefox_pref {'intl.charset.default':
		value => 'UTF-8'
	}
	firefox_pref {'font.name.default.x-western':
		value => 'sans-serif'
	}
	firefox_pref {'font.name.serif.x-western':
		value => 'Open Sans' # Who needs serif?
	}
	firefox_pref {'font.name.sans-serif.x-western':
		value => 'Open Sans'
	}
	firefox_pref {'font.name.monospace.x-western':
		value => 'Inconsolata Plus 0'
	}
	firefox_pref {'font.name.serif.ja':
		value => 'Meiryo'
	}
	firefox_pref {'font.name.sans-serif.ja':
		value => 'Meiryo'
	}
	firefox_pref {'font.name.monospace.ja':
		value => 'Meiryo'
	}
}