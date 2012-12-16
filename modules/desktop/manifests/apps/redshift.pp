class desktop::apps::redshift {
	aur_package {'redshift':}
	enduser_file {'.redshift':
		ensure => present,
		source => 'desktop/apps/redshift',
		require => Aur_package['redshift']
	}
	# TODO: Startup file
}