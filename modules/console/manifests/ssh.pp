class console::ssh {
	include console::gpg
	package {'autossh':}
	package {'mosh':}
	package {'monkeysphere-git':}
	enduser_file {'.ssh':
		ensure => directory
	}
	enduser_file {'.ssh/config':
		content => template('console/ssh/config.erb')
	}
	enduser_file {'.monkeysphere':
		ensure => directory
	}
	enduser_file {'.monkeysphere/identities':
		ensure => directory,
		source => 'console/ssh',
		recurse => true
	}
}