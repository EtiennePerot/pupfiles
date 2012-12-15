class base::packaging::multilib {
	pacman_repository {'multilib':
		mirrorlist => '/etc/pacman.d/mirrorlist',
		siglevel => 'PackageRequired'
	}
}