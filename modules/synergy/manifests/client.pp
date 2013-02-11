class synergy::client (
	$node = $hostname,
	$server
) {
	require synergy
	enduser_file {'.synergyc.sh':
		mode => 0700,
		content => regsubst(regsubst(template('synergy/client/.synergyc.sh'), '%SYNERGY_SERVER%', $server), '%SYNERGY_NODE%', $node)
	}
	kde_autostart {'.synergyc.sh':
		simplename => 'synergyc.sh'
	}
}