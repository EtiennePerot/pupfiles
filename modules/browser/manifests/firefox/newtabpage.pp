class browser::firefox::newtabpage {
	firefox_pref {'browser.newtabpage.enabled':
		value => false
	}
	file {'/usr/share/.firefox_newtabpage':
		ensure => directory,
		source => 'puppet:///modules/browser/firefox/newtabpage',
		recurse => true
	}
	firefox_pref {'services.sync.prefs.sync.browser.newtab.url':
		value => false
	}
	firefox_pref {'browser.newtab.url':
		value => 'file:///usr/share/.firefox_newtabpage/newtabpage.html'
	}
	firefox_pref {'services.sync.prefs.sync.browser.startup.homepage':
		value => false
	}
	firefox_pref {'browser.startup.homepage':
		value => 'file:///usr/share/.firefox_newtabpage/newtabpage.html'
	}
}