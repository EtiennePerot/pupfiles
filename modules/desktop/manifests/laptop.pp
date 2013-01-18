class desktop::laptop (
	$desktop_environment = 'kde'
) {
	package {'hdparm':}
	package {'sdparm':}
	package {'laptop-mode-tools':
		require => [Package['hdparm'], Package['sdparm']]
	}
	systemd_service {'laptop-mode':
		require => Package['laptop-mode-tools']
	}
	package {'powertop':}
	package {'xf86-input-mtrack-git':}
	case $desktop_environment {
		'kde': {
			aur_package {'kcm_touchpad':}
		}
	}
}