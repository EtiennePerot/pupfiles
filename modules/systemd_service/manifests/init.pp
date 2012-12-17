define systemd_service (
	$enable = true,
	$ensure = 'default'
) {
	# Workaround for Puppet bug https://projects.puppetlabs.com/issues/18129
	require systemd_service::symlink_hack
	if $ensure == 'default' {
		service {"$title.service":
			enable => $enable,
			provider => 'systemd'
		}
	} else {
		service {"$title.service":
			enable => $enable,
			ensure => $ensure,
			provider => 'systemd'
		}
	}
}