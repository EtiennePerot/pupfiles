class systemd_service::symlink_hack {
	# Workaround for Puppet bug https://projects.puppetlabs.com/issues/18129
	if ! defined(Package['systemd']) {
		package {'systemd':}
	}
	file {'/bin/systemctl':
		ensure => link,
		target => '/usr/bin/systemctl',
		require => Package['systemd']
	}
}