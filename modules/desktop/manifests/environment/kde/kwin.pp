class desktop::environment::kde::kwin {
	kde_rc::merge {'kwinrc':
		source => 'desktop/environment/kde/kwin'
	}
}