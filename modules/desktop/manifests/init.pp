class desktop (
	$laptop = false,
	$graphics_drivers = 'nvidia',
	$dpi = 112,
	$desktop_environment = 'kde',
	$kde_compositing = 'OpenGL',
	$browser = 'firefox',
	$apps = true,
	$fonts = true,
	$media = true,
	$games = false,
	$dotsync = undef,
	$dotsyncdecrypt = undef
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
				dpi => $dpi,
				laptop => $laptop,
				compositing => $kde_compositing
			}
		}
	}
	class {'desktop::sync':
		dotsync => $dotsync,
		dotsyncdecrypt => $dotsyncdecrypt
	}
	if $browser {
		browser {$browser:}
	}
	browser {'tor-browser':} # No machine should not have no way of anonymously communicating with the outside
	include desktop::networkmanager
	if $apps {
		include desktop::apps
	}
	if $fonts {
		include desktop::fonts
	}
	if $media {
		include desktop::media
	}
	if $games {
		include desktop::games
	}
}