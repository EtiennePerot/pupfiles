class desktop::environment::kde::kmix {
	package {'kdemultimedia-kmix':}
	kde_rc::merge {'kmixrc':
		source => 'desktop/environment/kde/kmix'
	}
}