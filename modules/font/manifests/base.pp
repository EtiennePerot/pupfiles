class font::base {
	include desktop::xorg
	package {'fontconfig':
		require => Package['xorg-server']
	}
	file {'/usr/share/fonts':
		ensure => directory,
		mode => 0644,
		require => Package['fontconfig']
	}
	file {'/usr/share/fonts/TTF':
		ensure => directory,
		mode => 0644,
		require => Package['fontconfig']
	}
	exec {'Update font cache (fc-cache)':
		command => shellquote('/usr/bin/env', 'fc-cache', '-f'),
		refreshonly => true
	}
}