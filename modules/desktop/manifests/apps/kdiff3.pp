class desktop::apps::kdiff3 {
	package {'kdiff3':}
	kde_rc::merge {'kdiff3rc':
		source => 'desktop/apps/kdiff3'
	}
}