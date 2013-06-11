class base::networking::tor {
	package {'tor':}
	file {'/etc/tor/torrc':
		source => 'puppet:///modules/base/networking/tor/torrc',
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
		require => Package['torsocks']
	}
}