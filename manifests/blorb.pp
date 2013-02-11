class {'base::etienne':}

class {'console':}

class {'desktop':
	graphics_drivers => 'catalyst',
	games => true,
	dpi => 102
}

network_interface {$ethernet_macaddress:
	rename => 'wired0',
	macspoof => false, # Desktop machine, not much risk
	ipv6_privacy => true
}

class {'synergy::server':
	config => template('private/synergy/blorb2.synergy.conf')
}