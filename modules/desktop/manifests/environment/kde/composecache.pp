class desktop::environment::kde::composecache {
	enduser_file {'.compose-cache':
		ensure => directory
	}
	mount {'/home/etienne/.compose-cache':
		ensure => mounted,
		atboot => true,
		device => 'tmpfs',
		fstype => 'tmpfs',
		options => 'auto,nodev,uid=etienne,gid=users',
		require => Enduser_file['.compose-cache']
	}
}