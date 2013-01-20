define kde_autostart (
	$filename = $name,
	$simplename = false,
	$absolutetarget = false
) {
	if $simplename {
		$actual_name = $simplename
	} else {
		$actual_name = regsubst($filename, '^.*/([^/]+)$', '\1')
	}
	if ! defined(Enduser_file['.kde4']) {
		enduser_file {'.kde4':
			ensure => directory
		}
	}
	if ! defined(Enduser_file['.kde4/Autostart']) {
		enduser_file {'.kde4/Autostart':
			ensure => directory
		}
	}
	enduser_file {".kde4/Autostart/$actual_name":
		ensure => link,
		target => $filename,
		absolutetarget => $absolutetarget,
		require => Enduser_file[$filename]
	}
}