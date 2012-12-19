class kde_rc::base {
	enduser_file {'.kde4':
		ensure => directory
	}
	enduser_file {'.kde4/share':
		ensure => directory
	}
	enduser_file {'.kde4/share/config':
		ensure => directory
	}
}