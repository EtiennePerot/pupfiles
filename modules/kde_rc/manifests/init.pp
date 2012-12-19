define kde_rc (
	$fullpath = false,
	$ensure = present,
	$mode = 0600,
	$source = false,
	$content = false,
	$replace = true
) {
	require kde_rc::base
	if $fullpath == false {
		$final_path = ".kde4/share/config/$name"
	} else {
		$final_path = $fullpath
	}
	enduser_file {$final_path:
		filename => $name,
		ensure => $ensure,
		mode => $mode,
		source => $source,
		content => $content,
		replace => $replace
	}
}