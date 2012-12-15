define pacman_repository (
	$server = false,
	$mirrorlist = '/etc/pacman.d/mirrorlist',
	$siglevel = false
) {
	include pacman_repository::refresh
	if $server {
		pacman_repository::server {$title:
			server => $server,
			siglevel => $siglevel,
			notify => Exec['refresh_pacman_database']
		}
	} else {
		pacman_repository::mirrorlist {$title:
			mirrorlist => $mirrorlist,
			siglevel => $siglevel,
			notify => Exec['refresh_pacman_database']
		}
	}
}