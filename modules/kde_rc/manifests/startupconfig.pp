class kde_rc::startupconfig {
	exec {'Refresh etienne KDE4 startupconfig':
		command => shellquote(
			'/usr/bin/env', 'kstartupconfig4'
		),
		refreshonly => true,
		user => 'etienne',
		environment => [
			'HOME=/home/etienne'
		],
		cwd => '/home/etienne',
		provider => 'shell'
	}
	exec {'Refresh root KDE4 startupconfig':
		command => shellquote(
			'/usr/bin/env', 'kstartupconfig4'
		),
		refreshonly => true,
		user => 'root',
		environment => [
			'HOME=/root'
		],
		cwd => '/root',
		logoutput => true
	}
}