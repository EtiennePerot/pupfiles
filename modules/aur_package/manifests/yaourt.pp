class aur_package::yaourt {
	include base::packaging::archlinuxfr
	package {'pacman-color':
		require => Class['base::packaging::archlinuxfr']
	}
	package {'customizepkg':
		require => Class['base::packaging::archlinuxfr']
	}
	package {'yaourt':
		require => Class['base::packaging::archlinuxfr']
	}
}