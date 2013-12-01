class desktop::environment::kde::kwin (
	$compositing = 'OpenGL'
) {
	kde_rc::merge {'kwinrc':
		source => 'desktop/environment/kde/kwin'
	}
	kde_rc::ini {'kwinrc|Compositing|Backend':
		value => $compositing
	}
}