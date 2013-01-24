define kde_rc (
	$fullpath = false,
	$ensure = present,
	$mode = 0600,
	$source = false,
	$content = false,
	$replace = true,
	$rebuild_startup_config = false
) {
	if $rebuild_startup_config {
		include kde_rc::startupconfig
		$tonotify = [Class['kde_rc::startupconfig']]
	} else {
		$tonotify = []
	}
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
		replace => $replace,
		notify => $tonotify
	}
}