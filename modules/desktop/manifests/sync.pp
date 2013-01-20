class desktop::sync {
	aur_package {'spideroak':}
	enduser_file {'.sync':
		ensure => directory,
		noroot => true
	}
	if ! $__custom_has_dot_sync {
		enduser_file {'.sync-decrypt':
			ensure => directory,
			noroot => true
		}
	}
	enduser_file {'.sync/encfs':
		ensure => directory,
		noroot => true
	}
	file {'/usr/bin/DotSyncMount':
		mode => 0755,
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/desktop/sync/DotSyncMount'
	}
	package {'encfs':}
	mount {'/home/etienne/.sync-decrypt':
		ensure => defined,
		atboot => true,
		device => 'DotSyncMount#_',
		fstype => 'fuse',
		options => 'defaults',
		require => [Package['encfs'], File['/usr/bin/DotSyncMount']]
	}
}