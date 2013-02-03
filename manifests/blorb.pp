class {'base::etienne':}

network_interface {$ethernet_macaddress:
	rename => 'wired0',
	macspoof => false, # Desktop machine, not much risk
	ipv6_privacy => true
}

class {'console':}

class {'desktop':
	graphics_drivers => 'catalyst',
	games => true,
	dpi => 102
}
