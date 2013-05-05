class base::timekeeping {
	require certs
	aur_package {'tlsdate':}
	systemd_service {'tlsdate':
		enable => true,
		require => Aur_package['tlsdate']
	}
	systemd_service {'ntpd':
		enable => false
	}
}