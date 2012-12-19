class desktop (
	$laptop = false,
	$graphics_drivers = 'nvidia',
	$desktop_environment = 'kde',
	$apps = true,
	$fonts = true,
	$games = false
) {
	include desktop::xorg
	if $laptop {
		class {'desktop::laptop':
			desktop_environment => $desktop_environment
		}
	}
	case $graphics_drivers {
		'nvidia': {
			include desktop::graphics::nvidia
		}
		'ati', 'amd', 'catalyst': {
			include desktop::graphics::catalyst
		}
		'intel': {
			include desktop::graphics::intel
		}
	}
	case $desktop_environment {
		'kde': {
			include desktop::environment::kde
		}
	}
	include desktop::networkmanager
	if $apps {
		include desktop::apps
	}
	if $fonts {
		include desktop::fonts
	}
	if $games {
		include desktop::games
	}
}