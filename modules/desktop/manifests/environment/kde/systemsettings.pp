class desktop::environment::kde::systemsettings {
	# This is about the "System Settings" application (KCM host), not actual system settings.
	kde_rc::merge {'systemsettingsrc':
		source => 'desktop/environment/kde/systemsettings'
	}
}