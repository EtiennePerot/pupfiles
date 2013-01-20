class browser::firefox::refcontrol {
	firefox_pref {'refcontrol.first_run':
		value => false
	}
	firefox_pref {'refcontrol.enabled':
		value => true,
		isdefault => true
	}
	firefox_pref {'refcontrol.contextMenu':
		value => true,
		isdefault => true
	}
	firefox_pref {'refcontrol.statusbar':
		value => 0,
		isdefault => true
	}
	firefox_pref {'services.sync.prefs.sync.refcontrol.actions':
		value => true
	}
}