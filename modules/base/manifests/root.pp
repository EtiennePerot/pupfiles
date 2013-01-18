class base::root {
	include base::systemd
	include console::zsh
	user {'root':
		home => '/root',
		managehome => true,
		gid => 'root',
		groups => ['root', 'wheel', 'sys', 'adm'],
		membership => minimum,
		comment => 'System root account',
		system => false,
		shell => '/bin/zsh',
		require => [Class['console::zsh'], Group['adm']],
		password => template('private/base/root/password')
	}
	file {'/root':
		ensure => directory,
		mode => 0600,
		owner => 'root',
		group => 'root'
	}
}