class desktop::environment::kde::themes::oxygen {
	kde_rc::merge {'oxygenrc':
		source => 'desktop/environment/kde/themes/oxygen'
	}
}