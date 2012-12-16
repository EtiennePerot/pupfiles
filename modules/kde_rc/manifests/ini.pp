define kde_rc::ini (
	$file = false,
	$section = false,
	$setting = false,
	$value = false
) {
	case $title {
		/^([^|]+)\|([^|]+)\|([^=]+)=(.*)$/: {
			$actual_file = $1
			$actual_section = $2
			$actual_setting = $3
			$actual_value = $4
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
	if ! defined(Kde_rc[$actual_file]) {
		kde_rc {$actual_file:
			ensure => present,
			content => '',
			replace => false
		}
	}
	ini_setting {"/home/etienne/.kde4/share/config/$actual_file/$actual_section/$actual_setting":
		path => "/home/etienne/.kde4/share/config/$actual_file",
		section => $actual_section,
		setting => $actual_setting,
		value => $actual_value,
		key_val_separator => '=',
		require => Kde_rc[$actual_file]
	}
	ini_setting {"/root/.kde4/share/config/$actual_file/$actual_section/$actual_setting":
		path => "/root/.kde4/share/config/$actual_file",
		section => $actual_section,
		setting => $actual_setting,
		value => $actual_value,
		key_val_separator => '=',
		require => Kde_rc[$actual_file]
	}
}