define enduser_file::single (
	$filename,
	$owner,
	$group,
	$ensure = present,
	$mode = 0600,
	$source = false,
	$recurse = false,
	$content = false,
	$replace = true
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
			"puppet:///modules/$source/$filename"
		]
		}
	}
	if $content == false {
		if $ensure == directory and $source == false {
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
				ensure => $ensure,
				mode => $mode,
				owner => $owner,
				group => $group,
				source => $multisource,
				recurse => $recurse,
				replace => $replace
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