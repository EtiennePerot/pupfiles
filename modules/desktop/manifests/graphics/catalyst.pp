class desktop::graphics::catalyst {
	include base::kernel::dkms
	package {'catalyst-dkms':
		require => Class['base::kernel::dkms']
	}
	package {'catalyst-utils':}
	package {'lib32-catalyst-utils':}
}