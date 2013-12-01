class desktop::sync (
	$dotsync = undef,
	$dotsyncdecrypt = undef
) {
	if $dotsync == undef {
		$dotsync_path = '/home/etienne/.sync'
	} else {
		$dotsync_path = $dotsync
	}
	if $dotsyncdecrypt == undef {
		$dotsyncdecrypt_path = '/home/etienne/.sync-decrypt'
	} else {
		$dotsyncdecrypt_path = $dotsyncdecrypt
	}
	aur_package {'spideroak':}
	enduser_file {'.sync':
		ensure => directory,
		noroot => true
	}
	if inline_template('<%= File.exists?(@dotsyncdecrypt_path) %>') == 'false' {
		# Need to check for non-existence so that if .sync-decrypt is a mountpoint, it doesn't get trashed
		enduser_file {'.sync-decrypt':
			ensure => directory,
			noroot => true
		}
	}
	if inline_template('<%= File.exists?(@dotsync_path + "/encfs") %>') == 'true' {
		# Only define this once synchronization has kicked in, which is true when the encfs subdirectory exists
		file {'/usr/bin/DotSyncMount':
			mode => 0755,
			owner => 'root',
			group => 'root',
			content => template('desktop/sync/DotSyncMount.erb')
		}
		package {'encfs':}
		mount {'/home/etienne/.sync-decrypt':
			ensure => defined,
			atboot => true,
			device => 'DotSyncMount#_',
			fstype => 'fuse',
			options => 'auto,defaults',
			require => [Package['encfs'], File['/usr/bin/DotSyncMount']]
		}
	}
}