class browser::firefox::privacy {
	firefox_pref {'network.dns.disablePrefetch':
		value => true
	}
	firefox_pref {'network.prefetch-next':
		value => false
	}
	firefox_pref {'privacy.clearOnShutdown.cookies':
		value => false
	}
	firefox_pref {'privacy.clearOnShutdown.sessions':
		value => false
	}
	firefox_pref {'privacy.donottrackheader.enabled':
		value => false,
		isdefault => true
	}
	firefox_pref {'privacy.sanitize.sanitizeOnShutdown':
		value => true
	}
	firefox_pref {'signon.rememberSignons':
		value => false
	}
	firefox_pref {'geo.enabled':
		value => false
	}
	firefox_pref {'dom.storage.enabled':
		value => false
	}
	firefox_pref {'browser.cache.offline.capacity':
		value => 0
	}
	firefox_pref {'browser.cache.offline.enable':
		value => false
	}
	firefox_pref {'browser.cache.memory.capacity':
		value => 0
	}
	firefox_pref {'browser.cache.memory.enable':
		value => false
	}
	firefox_pref {'network.http.sendSecureXSiteReferrer':
		value => false
	}
	firefox_pref {'network.cookie.cookieBehavior':
		# Allow first-party cookies, do not allow third-party cookies. First-party cookies are destroyed on page close by Self-Destructing Cookies add-on.
		value => 1
	}
	firefox_pref {'network.cookie.lifetimePolicy':
		value => 2
	}
	firefox_pref {'security.enable_ssl3':
		value => true,
		isdefault => true
	}
	firefox_pref {'security.enable_tls':
		value => true,
		isdefault => true
	}
	firefox_pref {'network.proxy.socks_remote_dns':
		value => true
	}
	firefox_pref {'toolkit.telemetry.enabled':
		value => false,
		isdefault => true
	}
}