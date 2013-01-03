class desktop::apps::okular {
	package {'kdegraphics-okular':}
	kde_rc::merge {'okularrc':
		source => 'desktop/apps/okular'
	}
	kde_rc::merge {'okularpartrc':
		source => 'desktop/apps/okular'
	}
}