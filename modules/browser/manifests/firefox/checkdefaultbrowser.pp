class browser::firefox::checkdefaultbrowser {
	firefox_pref {'browser.shell.checkDefaultBrowser':
		value => false,
		isdefault => true
	}
}