class sysprivacy::ipv6 {
	sysctl {'net.ipv6.conf.all.use_tempaddr':
		value => 2
	}
	sysctl {'net.ipv6.conf.default.use_tempaddr':
		value => 2
	}
	# Supports at most 3 wired or wifi interfaces connected before applying this setting
	# (Also assumes that they were properly renamed; see interface_rename module)
	if $macaddress_wired0 {
		sysctl {'net.ipv6.conf.wired0.use_tempaddr':
			value => 2
		}
	}
	if $macaddress_wired1 {
		sysctl {'net.ipv6.conf.wired1.use_tempaddr':
			value => 2
		}
	}
	if $macaddress_wired2 {
		sysctl {'net.ipv6.conf.wired2.use_tempaddr':
			value => 2
		}
	}
	if $macaddress_wifi0 {
		sysctl {'net.ipv6.conf.wifi0.use_tempaddr':
			value => 2
		}
	}
	if $macaddress_wifi1 {
		sysctl {'net.ipv6.conf.wifi1.use_tempaddr':
			value => 2
		}
	}
	if $macaddress_wifi2 {
		sysctl {'net.ipv6.conf.wifi2.use_tempaddr':
			value => 2
		}
	}
}