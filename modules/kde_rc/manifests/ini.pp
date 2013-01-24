define kde_rc::ini (
	$fullpath = false,
	$file = false,
	$section = false,
	$setting = false,
	$value = false,
	$rebuild_startup_config = false
) {
	require kde_rc::base
	if $rebuild_startup_config {
		include kde_rc::startupconfig
		$tonotify = [Class['kde_rc::startupconfig']]
	} else {
		$tonotify = []
	}
	case $title {
		/^([^|]+)\|([^|]+)\|([^=]+)=(.*)$/: {
			if $file != false {
				$actual_file = $file
			} else {
				$actual_file = $1
			}
			if $section != false {
				$actual_section = $section
			} else {
				$actual_section = $2
			}
			if $setting != false {
				$actual_setting = $setting
			} else {
				$actual_setting = $3
			}
			if $value != false {
				$actual_value = $value
			} else {
				$actual_value = $4
			}
		}
		/^([^|]+)\|([^|]+)\|([^=]+)$/: {
			if $file != false {
				$actual_file = $file
			} else {
				$actual_file = $1
			}
			if $section != false {
				$actual_section = $section
			} else {
				$actual_section = $2
			}
			if $setting != false {
				$actual_setting = $setting
			} else {
				$actual_setting = $3
			}
			if $value == false {
				fail('Value not specified.')
			} else {
				$actual_value = $value
			}
		}
		default: {
			if $file == false {
				fail('File not specified.')
			} else {
				$actual_file = $file
			}
			if $section == false {
				fail('Section not specified.')
			} else {
				$actual_section = $section
			}
			if $setting == false {
				fail('Setting not specified.')
			} else {
				$actual_setting = $setting
			}
			if $value == false {
				fail('Value not specified.')
			} else {
				$actual_value = $value
			}
		}
	}
	if $fullpath == false {
		$final_file = ".kde4/share/config/$actual_file"
	} else {
		$final_file = $fullpath
	}
	if ! defined(Kde_rc[$final_file]) {
		kde_rc {$final_file:
			fullpath => $final_file,
			ensure => present,
			content => '',
			replace => false,
			notify => $tonotify
		}
	}
	enduser_file::ini {"$final_file/$actual_section/$actual_setting":
		filename => $final_file,
		section => $actual_section,
		setting => $actual_setting,
		value => $actual_value,
		key_val_separator => '=',
		require => Kde_rc[$final_file],
		notify => $tonotify
	}
}