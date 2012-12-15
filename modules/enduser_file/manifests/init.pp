define enduser_file (
	$ensure = present,
	$mode = 0600,
	$source = [],
	$recurse = false
) {
	enduser_file::single {"/home/etienne/$name":
		owner => 'etienne',
		group => 'users',
		ensure => $ensure,
		mode => $mode,
		source => $source,
		recurse => $recurse
	}
	enduser_file::single {"/root/$name":
		owner => 'root',
		group => 'root',
		ensure => $ensure,
		mode => $mode,
		source => $source,
		recurse => $recurse
	}
}