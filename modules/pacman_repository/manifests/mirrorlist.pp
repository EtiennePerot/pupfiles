define pacman_repository::mirrorlist (
	$mirrorlist,
	$siglevel
) {
	ini_setting {"/etc/pacman.conf/$title/include":
		path => '/etc/pacman.conf',
		section => $title,
		setting => 'Include',
		value => $mirrorlist
	}
	ini_setting {"/etc/pacman.conf/$title/siglevel":
		path => '/etc/pacman.conf',
		section => $title,
		setting => 'SigLevel',
		value => $siglevel,
		require => Ini_setting["/etc/pacman.conf/$title/include"]
	}
}