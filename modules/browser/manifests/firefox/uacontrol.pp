class browser::firefox::uacontrol {
	firefox_pref {'uacontrol.first_run':
		value => false
	}
	firefox_pref {'uacontrol.enabled':
		value => true,
		isdefault => true
	}
	firefox_pref {'uacontrol.contextMenu':
		value => true,
		isdefault => true
	}
	firefox_pref {'uacontrol.statusbar':
		value => false,
		isdefault => true
	}
	firefox_pref {'services.sync.prefs.sync.uacontrol.actions':
		value => true
	}
}