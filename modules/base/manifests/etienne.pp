class base::etienne {
	include base
	include console::zsh
	user {'etienne':
		home => '/home/etienne',
		managehome => true,
		gid => 'users',
		groups => ['users', 'wheel'],
		membership => minimum,
		comment => 'Etienne Perot',
		system => false,
		shell => '/bin/zsh',
		require => Package['zsh'],
		password => template('private/base/etienne/password')
	}
	file {'/home/etienne':
		ensure => directory,
		mode => 0600,
		owner => 'etienne',
		group => 'users'
	}
}