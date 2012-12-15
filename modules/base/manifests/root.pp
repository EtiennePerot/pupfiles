class base::root {
	include console::zsh
	user {'root':
		home => '/root',
		managehome => true,
		gid => 'root',
		groups => ['root', 'wheel', 'sys'],
		membership => minimum,
		comment => 'System root account',
		system => false,
		shell => '/bin/zsh',
		require => Package['zsh'],
		password => template('private/base/root/password')
	}
	file {'/root':
		ensure => directory,
		mode => 0600,
		owner => 'root',
		group => 'root'
	}
}