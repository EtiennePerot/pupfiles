class desktop::environment::kde::notify {
	kde_rc::merge {'kde.notifyrc':
		source => 'desktop/environment/kde/notify'
	}
}