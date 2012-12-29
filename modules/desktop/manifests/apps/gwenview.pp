class desktop::apps::gwenview {
	package {'kdegraphics-gwenview':}
	kde_rc::merge {'gwenviewrc':
		source => 'desktop/apps/gwenview'
	}
}