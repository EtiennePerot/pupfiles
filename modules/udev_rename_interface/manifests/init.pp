define udev_rename_interface (
	$macaddress = $name,
	$rename
) {
	udev_rule {"10-ifrename-$rename":
		content => "SUBSYSTEM==\"net\", ATTR{address}==\"$macaddress\", NAME=\"$rename\""
	}
}