define pacman_repository::server (
	$server,
	$siglevel
) {
	ini_setting {"/etc/pacman.conf/$title/server":
		path => '/etc/pacman.conf',
		section => $title,
		setting => 'Server',
		value => $server
	}
	ini_setting {"/etc/pacman.conf/$title/siglevel":
		path => '/etc/pacman.conf',
		section => $title,
		setting => 'SigLevel',
		value => $siglevel,
		require => Ini_setting["/etc/pacman.conf/$title/server"]
	}
}