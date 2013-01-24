class desktop::environment::kde::kdm {
	kde_rc::merge {'kdmrc':
		absolutepath => '/usr/share/config/kdm/kdmrc',
		source => 'desktop/environment/kde/kdm'
	}
}