class browser::firefox::requestpolicy {
	firefox_pref {'extensions.requestpolicy.autoReload':
		value => false
	}
	firefox_pref {'extensions.requestpolicy.initialSetupDialogShown':
		value => true
	}
}