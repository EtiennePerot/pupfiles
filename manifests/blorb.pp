class {'base::etienne':}

network_interface {$ethernet_macaddress:
	rename => 'wired0',
	macspoof => [
		'wired_desktop_dedicated',
		'wired_desktop_onboard'
	],
	ipv6_privacy => true
}

class {'console':}

class {'desktop':
	graphics_drivers => 'catalyst',
	games => true,
	dpi => 102
}
