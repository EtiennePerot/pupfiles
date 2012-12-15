class desktop::graphics::catalyst {
	include base::kernel::dkms
	package {'catalyst-dkms':
		require => Class['base::kernel::dkms']
	}
	package {'catalyst-utils':}
	include base::packaging::multilib
	package {'lib32-catalyst-utils':
		require => Class['base::packaging::multilib']
	}
}