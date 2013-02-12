define kde_autostart (
	$filename = $name,
	$simplename = false,
	$absolutetarget = false,
	$command = false
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
	if $command {
		enduser_file {".kde4/Autostart/$actual_name":
			mode => 0700,
			content => regsubst(template('kde_autostart/single_command.sh'), '%COMMAND%', shellquote($command))
		}
	} else {
		enduser_file {".kde4/Autostart/$actual_name":
			ensure => link,
			target => $filename,
			absolutetarget => $absolutetarget,
			require => Enduser_file[$filename]
		}
	}
}