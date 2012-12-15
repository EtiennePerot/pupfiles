class base::sudo {
	package {'sudo':}
	group {'wheel':}
	file {'/etc/sudoers.d/allow-wheel':
		ensure => present,
		content => '%wheel ALL=(ALL) NOPASSWD: ALL',
		require => Package['sudo']
	}
}