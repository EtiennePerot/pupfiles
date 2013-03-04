class base::systemd {
	package {'systemd':}
	group {'adm':
		require => Package['systemd']
	}
	ini_setting {'Limit systemd journal to 50MB':
		path => '/etc/systemd/journald.conf',
		section => 'Journal',
		setting => 'SystemMaxUse',
		value => '50M',
		require => Package['systemd']
	}
	systemd_service {'systemd-readahead-collect':}
	systemd_service {'systemd-readahead-replay':}
}