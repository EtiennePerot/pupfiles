class desktop::apps::redshift {
	aur_package {'redshift':}
	enduser_file {'.redshift.sh':
		ensure => present,
		mode => 0700,
		source => 'desktop/apps/redshift',
		require => Aur_package['redshift']
	}
	kde_autostart {'.redshift.sh':
		simplename => 'redshift.sh',
		require => Enduser_file['.redshift.sh']
	}
}