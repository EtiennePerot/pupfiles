class console::git {
	package {'git':}
	include console::pager
	enduser_file {'.gitconfig':
		ensure => present,
		source => 'console/git',
		require => [Package['git'], Class['console::pager']]
	}
	enduser_file {'.gitignore':
		ensure => present,
		source => 'console/git',
		require => Package['git']
	}
}