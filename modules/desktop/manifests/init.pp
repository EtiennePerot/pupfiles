class desktop (
	$graphics_drivers = "nvidia",
	$desktop_environment = "kde",
	$games = false
) {
	case $graphics_drivers {
		'nvidia': {
			include desktop::graphics::nvidia
		}
		'ati', 'amd', 'catalyst': {
			include desktop::graphics::catalyst
		}
	}
	case $desktop_environment {
		'kde': {
			include desktop::environment::kde
		}
	}
	if $games {
		include desktop::games
	}
}