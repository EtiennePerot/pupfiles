class desktop (
	$laptop = false,
	$graphics_drivers = 'nvidia',
	$dpi = 112,
	$desktop_environment = 'kde',
	$browser = 'firefox',
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
			class {'desktop::environment::kde':
				dpi => $dpi
			}
		}
	}
	if $browser {
		browser {$browser:}
	}
	browser {'torbrowser':} # No machine should not have no way of anonymously communicating with the outside
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