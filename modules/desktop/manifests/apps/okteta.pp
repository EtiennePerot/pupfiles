class desktop::apps::okteta {
	package {'kdesdk-okteta':}
	kde_rc::merge {'oktetarc':
		source => 'desktop/apps/okteta'
	}
}