class akonadi_resource {
	package {'akonadi':}
	package {'kdepim-akonadiconsole':}
	package {'akonadi-googledata':}
	if ! defined(Enduser_file['.config']) {
		enduser_file {'.config':
			ensure => directory
		}
	}
	enduser_file {'.config/akonadi':
		ensure => directory
	}
}