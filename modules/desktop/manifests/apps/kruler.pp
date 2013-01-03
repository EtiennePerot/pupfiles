class desktop::apps::kruler {
	package {'kdegraphics-kruler':}
	kde_rc::merge {'krulerrc':
		source => 'desktop/apps/kruler'
	}
}