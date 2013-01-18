class console::oh_my_zsh {
	include console::zsh
	aur_package {'oh-my-zsh-git':}
	aur_package {'zsh-completions':}
	aur_package {'zsh-syntax-highlighting':}
	include base::etienne
	include base::packaging::pkgfile
	enduser_file {'.zshrc':
		source => 'console/zsh',
		require => [
			Package['zsh'],                         # Actual shell
			Class['base::packaging::pkgfile'],      # Required for not-found hook
			Aur_package['zsh-syntax-highlighting'], # Required for syntax highlighting
			Enduser_file['.zsh']                    # Parent directory
		]
	}
	enduser_file {'.zsh':
		ensure => directory,
		source => 'console/zsh',
		recurse => true
	}
}