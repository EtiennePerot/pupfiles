class desktop::environment::kde::klipper {
	kde_rc::merge {'klipperrc':
		source => 'desktop/environment/kde/klipper'
	}
}