class desktop::environment::kde::globals {
	require desktop::fonts
	kde_rc::merge {'kdeglobals':
		source => 'desktop/environment/kde/globals'
	}
}