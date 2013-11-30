class base::networking::tor {
	package {'tor':}
	file {'/etc/tor/torrc':
		content => template('base/networking/tor/torrc.erb'),
		require => Package['tor']
	}
	systemd_service {'tor':
		require => Package['tor']
	}
	package {'torsocks':}
	file {'/etc/torsocks.d':
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => 0644,
		source => 'puppet:///modules/base/networking/tor/torsocks.d',
		recurse => true,
		force => true,
		purge => true,
		require => Package['torsocks']
	}
}