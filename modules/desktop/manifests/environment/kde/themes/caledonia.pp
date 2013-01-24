class desktop::environment::kde::themes::caledonia {
	aur_package {'plasma-theme-caledonia':}
	aur_package {'kdm-theme-caledonia':}
	aur_package {'ksplash-caledonia':}
	aur_package {'caledonia-icons':}
	kde_rc::merge {'special:Add caledonia theme options to kdmrc':
		filename => 'kdmrc',
		absolutepath => '/usr/share/config/kdm/kdmrc',
		source => 'desktop/environment/kde/themes/caledonia'
	}
	kde_rc::merge {'special:Add caledonia theme options to ksplash':
		filename => 'ksplashrc',
		source => 'desktop/environment/kde/themes/caledonia'
	}
	kde_rc::merge {'special:Add caledonia theme options to plasmarc':
		filename => 'plasmarc',
		source => 'desktop/environment/kde/themes/caledonia'
	}
}