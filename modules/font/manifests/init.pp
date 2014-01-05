define font (
	$source,
	$filename = $name
) {
	include font::base
	case $source {
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
	$firstletter = downcase(regsubst($filename, '^(.).*$', '\1'))
	if ! defined(File["/usr/local/share/fonts/$firstletter"]) {
		file {"/usr/local/share/fonts/$firstletter":
			ensure => directory,
			owner => root,
			group => root,
			mode => 0755,
		}
	}
	file {"/usr/local/share/fonts/$firstletter/$filename":
		ensure => present,
		source => $multisource,
		owner => root,
		group => root,
		mode => 0644,
		notify => Exec['Update font cache (fc-cache)']
	}
}