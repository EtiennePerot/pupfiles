class browser::firefox::selfdestructingcookies {
	# Self-destructing cookies: https://addons.mozilla.org/en-US/firefox/addon/self-destructing-cookies/
	firefox_pref {'extensions.jid0-9XfBwUWnvPx4wWsfBWMCm4Jj69E@jetpack.displayNotification':
		value => false
	}
	firefox_pref {'extensions.jid0-9XfBwUWnvPx4wWsfBWMCm4Jj69E@jetpack.gracePeriod':
		value => 30
	}
	firefox_pref {'extensions.jid0-9XfBwUWnvPx4wWsfBWMCm4Jj69E@jetpack.keepIFrames':
		value => false
	}
}