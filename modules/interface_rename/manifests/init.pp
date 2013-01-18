define interface_rename (
	$interface = $name,
	$macaddress,
	$priority = 10
) {
	udev_rule {"$priority-ifrename-$name":
		content => "SUBSYSTEM==\"net\", ATTR{address}==\"$macaddress\", NAME=\"$interface\""
	}
}