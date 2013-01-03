class desktop::environment::kde::kwallet {
	package {'kdeutils-kwallet':}
	kde_rc::merge {'kwalletrc':
		source => 'desktop/environment/kde/kwallet'
	}
	kde_rc::merge {'kwalletmanagerrc':
		source => 'desktop/environment/kde/kwallet'
	}
}