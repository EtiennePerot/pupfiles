class network_interface::macspoof::base {
	aur_package {'macchiato-git':}
	systemd_service {'macchiato':
		require => Aur_package['macchiato-git']
	}
}