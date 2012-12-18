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
	file {"/usr/share/fonts/TTF/$filename":
		ensure => present,
		source => $multisource,
		mode => 0644,
		notify => Exec['Update font cache (fc-cache)']
	}
}