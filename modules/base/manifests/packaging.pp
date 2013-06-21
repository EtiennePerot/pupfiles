class base::packaging {
	package {'pacman':}
	package {'abs':}
	package {'namcap':}
	include base::packaging::pkgfile
	include base::packaging::multilib
	include base::packaging::armh
	file {'/etc/pacman.d/pupfiles-options.conf':
		source => 'puppet:///modules/base/packaging/pacman.d/pupfiles-options.conf',
		require => Package['pacman']
	}
	ini_setting {'/etc/pacman.conf/options/include/pupfiles-options':
		path => '/etc/pacman.conf',
		section => 'options',
		setting => 'Include',
		value => '/etc/pacman.d/pupfiles-options.conf',
		require => File['/etc/pacman.d/pupfiles-options.conf']
	}
	bin_wrapper::torify {'pacman':
		torsocks_profile => '/etc/torsocks.d/packagemanagement.conf'
	}
	bin_wrapper::torify {'pacman-key':
		torsocks_profile => '/etc/torsocks.d/packagemanagement.conf'
	}
	bin_wrapper::torify {'yaourt':
		torsocks_profile => '/etc/torsocks.d/packagemanagement.conf'
	}
}