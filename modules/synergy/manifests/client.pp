class synergy::client (
	$node = $hostname,
	$server
) {
	require synergy
	kde_autostart {'synergyc.sh':
		command => ['synergyc', '--daemon', '--restart', '--no-tray', '--name', $node, $server]
	}
}