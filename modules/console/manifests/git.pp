class console::git {
	package {'git':}
	include console::pager
	enduser_file {'.gitconfig':
		ensure => present,
		source => 'puppet:///modules/console/git/.gitconfig',
		require => [Package['git'], Class['console::pager']]
	}
	enduser_file {'.gitignore':
		ensure => present,
		source => 'puppet:///modules/console/git/.gitignore',
		require => Package['git']
	}
}