class browser::firefox::nofirstrun {
	firefox_pref {'browser.feeds.showFirstRunUI':
		value => false
	}
	firefox_pref {'extensions.shownSelectionUI':
		value => true,
		isdefault => true
	}
	firefox_pref {'general.warnOnAboutConfig':
		value => false
	}
	firefox_pref {'security.warn_viewing_mixed':
		value => false
	}
	firefox_pref {'security.dialog_enable_delay':
		value => 0
	}
}