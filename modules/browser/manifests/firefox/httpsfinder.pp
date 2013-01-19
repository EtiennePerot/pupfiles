class browser::firefox::httpsfinder {
	firefox_pref {'extensions.httpsfinder.attemptSecureCookies':
		value => true
	}
	firefox_pref {'extensions.httpsfinder.autoforward':
		value => false
	}
	firefox_pref {'extensions.httpsfinder.firstrun':
		value => false
	}
	firefox_pref {'extensions.httpsfinder.secureWildcardCookies':
		value => true
	}
}