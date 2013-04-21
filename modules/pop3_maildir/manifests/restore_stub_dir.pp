class pop3_maildir::restore_stub_dir {
	require base::sudo
	# This is pretty hacky
	file {'/usr/bin/.restore-stub-dir':
		owner => 'root',
		mode => 0755,
		source => 'puppet:///modules/pop3_maildir/restore-stub-dir.sh'
	}
	file {'/etc/sudoers.d/restore_stub_dir':
		ensure => present,
		content => "ALL ALL=(ALL) NOPASSWD: /usr/bin/.restore-stub-dir\n",
		require => [Package['sudo'], File['/usr/bin/.restore-stub-dir']],
		mode => 0440
	}
}