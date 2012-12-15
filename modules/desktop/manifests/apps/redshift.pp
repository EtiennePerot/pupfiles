class desktop::apps::redshift {
	aur_package {'redshift':}
	enduser_file {'.redshift':
		ensure => present,
		source => 'puppet:///modules/desktop/apps/redshift/.redshift',
		require => Aur_package['redshift']
	}
	# TODO: Startup file
}