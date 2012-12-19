class desktop::laptop (
	$desktop_environment = 'kde'
) {
	package {'laptop-mode-tools':}
	systemd_service {'laptop-mode':
		require => Package['laptop-mode-tools']
	}
	package {'powertop':}
	package {'xf86-input-mtrack-git':}
	case $desktop_environment {
		'kde': {
			package {'kcm_touchpad':}
		}
	}
}