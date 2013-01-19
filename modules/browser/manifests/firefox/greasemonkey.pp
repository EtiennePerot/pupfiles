class browser::firefox::greasemonkey {
	firefox_pref {'extensions.greasemonkey.editor':
		value => '/usr/bin/xdg-open'
	}
	firefox_pref {'extensions.greasemonkey.showGrantsWarning':
		value => false
	}
	firefox_pref {'extensions.greasemonkey.stats.prompted':
		value => true
	}
}