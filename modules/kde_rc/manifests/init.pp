define kde_rc (
	$ensure = present,
	$mode = 0600,
	$source = false,
	$content = false,
	$replace = true
) {
	enduser_file {".kde4/share/config/$name":
		filename => $name,
		ensure => $ensure,
		mode => $mode,
		source => $source,
		content => $content,
		replace => $replace
	}
}