class akonadi_resource {
	package {'akonadi':}
	package {'kdepim-akonadiconsole':}
	package {'akonadi-googledata':}
	enduser_file {'.config':
		ensure => directory
	}
	enduser_file {'.config/akonadi':
		ensure => directory
	}
}