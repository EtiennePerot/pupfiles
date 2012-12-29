class desktop::apps::k3b {
	package {'k3b':}
	kde_rc::merge {'k3brc':
		source => 'desktop/apps/k3b'
	}
}