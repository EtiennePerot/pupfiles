define systemd_service (
	$service = $name,
	$enable = true,
	$ensure = 'default'
) {
	# Workaround for Puppet bug https://projects.puppetlabs.com/issues/18129
	require systemd_service::symlink_hack
	if $ensure == 'default' {
		service {"$service.service":
			enable => $enable,
			provider => 'systemd'
		}
	} else {
		service {"$service.service":
			enable => $enable,
			ensure => $ensure,
			provider => 'systemd'
		}
	}
}