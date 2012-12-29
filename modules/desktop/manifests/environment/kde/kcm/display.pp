class desktop::environment::kde::kcm::display {
	kde_rc::merge {'kcmdisplayrc':
		source => 'desktop/environment/kde/kcm/display'
	}
}