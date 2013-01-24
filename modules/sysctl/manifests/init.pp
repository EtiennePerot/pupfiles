define sysctl (
	$value,
	$key = $name,
	$file = false
) {
	if $file {
		if ! defined(File["/etc/sysctl.d/$file"]) {
			file {"/etc/sysctl.d/$file":
				owner => 'root',
				group => 'root',
				mode => 0000
			}
		}
		ini_setting { "sysctl:$file/$key":
			path => "/etc/sysctl.d/$file",
			section => '',
			setting => $key,
			value => $value,
			require => File["/etc/sysctl.d/$file"]
		}
	} else {
		ini_setting { "sysctl:$key":
			path => '/etc/sysctl.conf',
			section => '',
			setting => $key,
			value => $value
		}
	}
}