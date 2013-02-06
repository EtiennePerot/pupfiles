class desktop::environment::kde::ksmserver {
	kde_rc::merge {'ksmserverrc':
		source => 'desktop/environment/kde/ksmserver'
	}
}