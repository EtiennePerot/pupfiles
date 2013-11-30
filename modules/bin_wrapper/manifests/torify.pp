define bin_wrapper::torify (
	$binary_name = $name,
	$torsocks_profile = '/etc/torsocks.conf',
	$is_package_manager = undef
) {
	bin_wrapper {$binary_name:
		prefix => 'torsocks',
		environment => "TORSOCKS_CONF_FILE='$torsocks_profile'",
		is_package_manager => $is_package_manager
	}
}