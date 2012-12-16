class systemd_service::symlink_hack {
	# Workaround for Puppet bug https://projects.puppetlabs.com/issues/18129
	file {'/bin/systemctl':
		ensure => link,
		target => '/usr/bin/systemctl'
	}
}