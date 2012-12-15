class pacman_repository::refresh {
	exec {'refresh_pacman_database':
		command => shellquote(
			'/usr/bin/env', 'pacman',
			'-Sy'
		),
		refreshonly => true
	}
}