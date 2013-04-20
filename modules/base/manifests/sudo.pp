class base::sudo {
	package {'sudo':}
	group {'wheel':}
	file {'/etc/sudoers.d/allow-wheel':
		ensure => present,
		content => '%wheel ALL=(ALL) NOPASSWD: ALL',
		require => Package['sudo'],
		mode => 0440
	}
	file {'/etc/sudoers.d/defaults_keep_home':
		ensure => present,
		content => "Defaults env_keep += \"HOME\"\n", # Line at the end is important, otherwise sudo will die completely
		require => Package['sudo'],
		mode => 0440 # Important, otherwise sudo will die completely
	}
}