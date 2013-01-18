class base::systemd {
	package {'systemd':}
	group {'adm':
		require => Package['systemd']
	}
}