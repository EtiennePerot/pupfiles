define udev_rule (
	$filename = $name,
	$content = false,
	$source = false,
	$installdir = '/etc/udev/rules.d'
) {
	# udev means we must have systemd
	if ! defined(Package['systemd']) {
		package {'systemd':}
	}
	$fullfilename = "$installdir/$filename.rules"
	if $content == false {
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
					"puppet:///modules/private/$source/$filename.rule",
					"puppet:///modules/private/$source/$filename.rules",
					"puppet:///modules/$source/$filename",
					"puppet:///modules/$source/$filename.rule",
					"puppet:///modules/$source/$filename.rules"
				]
			}
		}
		file {$fullfilename:
			source => $multisource,
			require => Package['systemd']
		}
	} else {
		file {$fullfilename:
			content => $content,
			require => Package['systemd']
		}
	}
}