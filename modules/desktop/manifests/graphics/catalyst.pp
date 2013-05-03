class desktop::graphics::catalyst {
	package {'catalyst-hook':}
	package {'catalyst-utils':}
	include base::packaging::multilib
	package {'lib32-catalyst-utils':
		require => Class['base::packaging::multilib']
	}
}