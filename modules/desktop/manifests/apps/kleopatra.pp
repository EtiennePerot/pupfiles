class desktop::apps::kleopatra {
	package {'kdepim-kleopatra':}
	kde_rc::merge {'kleopatrarc':
		source => 'desktop/apps/kleopatra'
	}
}