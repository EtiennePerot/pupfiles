define enduser_file (
	$filename = $name,
	$ensure = present,
	$mode = 0600,
	$source = false,
	$recurse = false,
	$content = false,
	$replace = true
) {
	enduser_file::single {"/home/etienne/$name":
		filename => $filename,
		owner => 'etienne',
		group => 'users',
		ensure => $ensure,
		mode => $mode,
		source => $source,
		recurse => $recurse,
		content => $content,
		replace => $replace
	}
	enduser_file::single {"/root/$name":
		filename => $filename,
		owner => 'root',
		group => 'root',
		ensure => $ensure,
		mode => $mode,
		source => $source,
		recurse => $recurse,
		content => $content,
		replace => $replace
	}
}