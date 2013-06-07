class systemd_service::symlink_hack {
	if ! defined(Package['systemd']) {
		package {'systemd':}
	}
	# Workaround for Puppet bug https://projects.puppetlabs.com/issues/18129 - Not needed anymore!
	#file {'/bin/systemctl':
	#	ensure => link,
	#	target => '/usr/bin/systemctl',
	#	require => Package['systemd']
	#}
}