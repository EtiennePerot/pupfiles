class base::kernel::dkms {
	include base::kernel::linux_headers
	service {'dkms':
		enable => true
	}
}