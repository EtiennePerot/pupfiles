define network_interface (
	$macaddress = $name,
	$interface = false,
	$rename = false,
	$macspoof = false,
	$ipv6_privacy = false
) {
	if $name == 'all' or $name == 'default' {
		if $ipv6_privacy {
			network_interface::ipv6privacy {'all':}
			network_interface::ipv6privacy {'default':}
		}
	} else
	{
		if $rename {
			udev_rename_interface {$macaddress:
				rename => $rename
			}
			$actual_interface = $rename
		} else {
			$actual_interface = $interface
		}
		if $macspoof {
			network_interface::macspoof {$actual_interface:
				classes => $macspoof
			}
		}
		if $ipv6_privacy {
			network_interface::ipv6privacy {$actual_interface:}
		}
	}
}