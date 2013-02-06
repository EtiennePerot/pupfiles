class desktop::environment::kde::kcm::input {
	kde_rc::merge {'kcminputrc':
		source => 'desktop/environment/kde/kcm/input'
	}
	kde_rc::merge {'kxkbrc':
		source => 'desktop/environment/kde/kcm/input'
	}
}