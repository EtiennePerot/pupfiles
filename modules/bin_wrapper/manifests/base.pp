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
	file {'/etc/bin-wrappers/.bin-rewrap':
		source => 'puppet:///modules/bin_wrapper/bin-rewrap.sh',
		owner => 'root',
		group => 'root',
		mode => 0755,
		require => Package['bash']
	}
	file {'/etc/bin-wrappers/.wrapped-binaries':
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => 0644
	}
	file {'/etc/profile.d/bin-wrappers.sh':
		source => 'puppet:///modules/bin_wrapper/bin-wrappers.env.sh',
		owner => 'root',
		group => 'root',
		mode => 0755,
		require => Package['bash']
	}
	if inline_template('<%= File.exists?("/etc/kde/env") %>') == 'true' {
		file {'/etc/kde/env/bin-wrappers.sh':
			source => 'puppet:///modules/bin_wrapper/bin-wrappers.env.sh',
			owner => 'root',
			group => 'root',
			mode => 0755
		}
	}
}