class desktop::apps::kmymoney {
	package {'kmymoney':}
	kde_rc::merge {'kmymoneyrc':
		source => 'desktop/apps/kmymoney'
	}
}