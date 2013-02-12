class synergy::server (
	$node = $hostname,
	$config
) {
	require synergy
	enduser_file {'.synergy.conf':
		content => $config
	}
	kde_autostart {'synergys.sh':
		command => ['synergys']
	}
}