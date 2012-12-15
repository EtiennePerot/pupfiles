class console::rtorrent {
	include console::screen
	include console::zsh
	package {'rtorrent':}
	aur_package {'rutorrent':}
	user {'rtorrent':
		home => '/home/rtorrent',
		managehome => true,
		gid => 'users',
		system => false,
		shell => '/bin/zsh',
		require => Package['zsh']
	}
	file {'/home/rtorrent/.rtorrent.rc':
		ensure => present,
		mode => 0600,
		source => 'puppet:///modules/console/rtorrent/.rtorrent.rc',
		require => User['rtorrent']
	}
	# Todo: Web server and stuff, pyroscope patches
}