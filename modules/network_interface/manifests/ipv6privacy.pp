define network_interface::ipv6privacy (
	$interface = $name,
	$value = 2,
	$file = '10-ipv6-privacy.conf'
) {
	sysctl {"net.ipv6.conf.$interface.use_tempaddr":
		value => $value,
		file => $file
	}
}