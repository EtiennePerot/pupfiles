class desktop::apps::ktorrent {
	package {'ktorrent':}
	kde_rc::merge {'ktorrentrc':
		source => 'desktop/apps/ktorrent'
	}
}