define sysctl (
	$value,
	$key = $name
) {
	ini_setting { "sysctl:$key":
		path => '/etc/sysctl.conf',
		section => '',
		setting => $key,
		value => $value
	}
}