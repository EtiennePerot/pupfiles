class console::gpg::parcimonie {
	aur_package {'parcimonie-sh-git':}
	systemd_service {'parcimonie.sh@all-users':
		require => Aur_package['parcimonie-sh-git']
	}
}