define systemd_custom_service (
	$servicename = $name,
	$source = false,
	$content = false,
	$installdir = '/etc/systemd/system',
	$enable = true,
	$ensure = 'default'
) {
	if ! defined(Package['systemd']) {
		package {'systemd':}
	}
	$fullfilename = "$installdir/$servicename.service"
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
					"puppet:///modules/private/$source/$filename.service",
					"puppet:///modules/$source/$filename",
					"puppet:///modules/$source/$filename.service"
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
	systemd_service {$servicename:
		require => File[$fullfilename],
		enable => $enable,
		ensure => $ensure
	}
}