class console::oh_my_zsh {
	include console::zsh
	aur_package {'oh-my-zsh-git':}
	include base::etienne
	include base::packaging::pkgfile
	enduser_file {'.zshrc':
		source => 'puppet:///modules/console/zsh/.zshrc',
		require => [Package['zsh'], Class['base::packaging::pkgfile'], Enduser_file['.zsh']]
	}
	enduser_file {'.zsh':
		ensure => directory,
		source => 'puppet:///modules/console/zsh/.zsh',
		recurse => true
	}
}