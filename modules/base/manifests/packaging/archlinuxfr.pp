class base::packaging::archlinuxfr {
	pacman_repository {'archlinuxfr':
		server => 'http://repo.archlinux.fr/$arch',
		siglevel => 'Optional'
	}
}