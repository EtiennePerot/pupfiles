define aur_package (
	$ensure = installed
) {
	require aur_package::yaourt
	package {$title:
		name => "$name",
		ensure => $ensure
	}
}