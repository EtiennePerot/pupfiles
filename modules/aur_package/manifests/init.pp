define aur_package (
	$ensure = installed
) {
	include aur_package::yaourt
	package {$title:
		name => "$name",
		ensure => $ensure,
		require => Package['yaourt']
	}
}