class {'base::etienne':}

class {'sysprivacy':
	macspoof => false # Home desktop, not much risk
}

class {'console':}

class {'desktop':
	graphics_drivers => 'catalyst',
	games => true,
	dpi => 102
}
