class desktop::apps::ark {
	package {'kdeutils-ark':}
	kde_rc::merge {'arkrc':
		source => 'desktop/apps/ark'
	}
}