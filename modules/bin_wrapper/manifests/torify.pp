define bin_wrapper::torify (
	$binary_name = $name,
	$torsocks_profile = '/etc/torsocks.conf'
) {
	bin_wrapper {$binary_name:
		prefix => 'torsocks',
		environment => "TORSOCKS_CONF_FILE='$torsocks_profile'"
	}
}