define enduser_file::single (
	$filename,
	$owner,
	$group,
	$ensure = present,
	$mode = 0600,
	$source = false,
	$recurse = false,
	$content = false,
	$replace = true,
	$target = false,
	$absolutetarget = true,
	$targetprefix = ''
) {
	case $source {
		false: {
			$multisource = []
		}
		/^puppet:\/\/\//: {
			$multisource = [$source]
		}
		default: {
			$multisource = [
				"puppet:///modules/private/$source/$filename",
				"puppet:///modules/$source/$filename",
				"puppet:///modules/private/$source",
				"puppet:///modules/$source"
			]
		}
	}
	if $absolutetarget {
		$full_target = $target
	} else {
		$full_target = "$targetprefix/$target"
	}
	if $content == false {
		if $ensure == directory {
			if $source == false {
				file {$name:
					ensure => directory,
					mode => $mode,
					owner => $owner,
					group => $group,
					recurse => $recurse,
					replace => $replace
				}
			} else {
				file {$name:
					ensure => directory,
					mode => $mode,
					owner => $owner,
					group => $group,
					source => $multisource,
					recurse => $recurse,
					replace => $replace
				}
			}
		} else {
			if $ensure == link {
				file {$name:
					ensure => link,
					mode => $mode,
					owner => $owner,
					group => $group,
					replace => $replace,
					target => $full_target
				}
			} else {
				if $source == false {
					file {$name:
						ensure => $ensure,
						mode => $mode,
						owner => $owner,
						group => $group,
						replace => $replace
					}
				} else {
					file {$name:
						ensure => $ensure,
						mode => $mode,
						owner => $owner,
						group => $group,
						source => $multisource,
						recurse => $recurse,
						replace => $replace
					}
				}
			}
		}
	} else {
		file {$name:
			ensure => $ensure,
			mode => $mode,
			owner => $owner,
			group => $group,
			content => $content,
			recurse => $recurse,
			replace => $replace
		}
	}
}