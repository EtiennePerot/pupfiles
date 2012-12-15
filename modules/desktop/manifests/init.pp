class desktop (
	$graphics_drivers = 'nvidia',
	$desktop_environment = 'kde',
	$apps = true,
	$games = false
) {
	include desktop::xorg
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
	if $apps {
		include desktop::apps
	}
	if $games {
		include desktop::games
	}
}