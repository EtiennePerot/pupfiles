class bin_wrapper::base {
	if ! defined(Package['bash']) {
		package {'bash':}
	}
	file {'/etc/bin-wrappers':
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => 0644
	}
	file {'/etc/bin-wrappers/.bin-wrap':
		source => 'puppet:///modules/bin_wrapper/bin-wrap.sh',
		owner => 'root',
		group => 'root',
		mode => 0755,
		require => Package['bash']
	}
}