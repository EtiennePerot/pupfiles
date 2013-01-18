class sysprivacy::macspoof {
	package {'macchanger':}
	$macspoof_service = template('sysprivacy/macspoof.service')
	# Supports at most 3 wired or wifi interfaces connected before applying this setting
	# (Also assumes that they were properly renamed; see interface_rename module)
	if $macaddress_wired0 {
		systemd_custom_service {'macspoof@wired0':
			content => regsubst($macspoof_service, '%interface%', 'wired0', 'G')
		}
	}
	if $macaddress_wired1 {
		systemd_custom_service {'macspoof@wired1':
			content => regsubst($macspoof_service, '%interface%', 'wired1', 'G')
		}
	}
	if $macaddress_wired2 {
		systemd_custom_service {'macspoof@wired2':
			content => regsubst($macspoof_service, '%interface%', 'wired2', 'G')
		}
	}
	if $macaddress_wifi0 {
		systemd_custom_service {'macspoof@wifi0':
			content => regsubst($macspoof_service, '%interface%', 'wifi0', 'G')
		}
	}
	if $macaddress_wifi1 {
		systemd_custom_service {'macspoof@wifi1':
			content => regsubst($macspoof_service, '%interface%', 'wifi1', 'G')
		}
	}
	if $macaddress_wifi2 {
		systemd_custom_service {'macspoof@wifi2':
			content => regsubst($macspoof_service, '%interface%', 'wifi2', 'G')
		}
	}
}