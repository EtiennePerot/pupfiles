class synergy::server (
	$node = $hostname,
	$config
) {
	require synergy
	enduser_file {'.synergy.conf':
		content => $config
	}
	enduser_file {'.synergys.sh':
		mode => 0700,
		source => 'synergy/server'
	}
	kde_autostart {'.synergys.sh':
		simplename => 'synergys.sh'
	}
}