class kde_rc::base {
	if ! defined(Enduser_file['.kde4']) {
		enduser_file {'.kde4':
			ensure => directory
		}
	}
	if ! defined(Enduser_file['.kde4/share']) {
		enduser_file {'.kde4/share':
			ensure => directory
		}
	}
	enduser_file {'.kde4/share/config':
		ensure => directory
	}
}