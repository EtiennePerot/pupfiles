class desktop::networkmanager {
	package {'networkmanager':}
	package {'networkmanager-openvpn':}
	systemd_service {'NetworkManager':
		require => Package ['networkmanager']
	}
}