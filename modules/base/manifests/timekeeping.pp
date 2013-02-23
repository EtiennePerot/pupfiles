class base::timekeeping (
	$source = 'perot.me',
	$port = 443,
	$proxy = 'none',
	$cert = 'certs/perot.me.crt'
) {
	require certs
	aur_package {'tlsdate':}
	file {'/etc/tlsdate':
		ensure => directory
	}
	file {'/etc/tlsdate/tlsdated.conf':
		content => template('base/timekeeping/tlsdated.conf.erb')
	}
	file {'/etc/tlsdate/ca-roots':
		ensure => directory
	}
	file {'/etc/tlsdate/ca-roots/tlsdate-ca-roots.conf':
		content => file('/usr/share/ca-certificates/mozilla/StartCom_Certification_Authority.crt')
	}
	systemd_service {'tlsdated':}
}