define enduser_file::single (
	$owner,
	$group,
	$ensure = present,
	$mode = 0600,
	$source = [],
	$recurse = false
) {
	file {$name:
		ensure => $ensure,
		mode => $mode,
		owner => $owner,
		group => $group,
		source => $source,
		recurse => $recurse
	}
}