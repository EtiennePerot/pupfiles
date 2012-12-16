class base::kernel::dkms {
	include base::kernel::linux_headers
	systemd_service {'dkms':}
}