class sysprivacy (
	$ipv6privacy = true,
	$macspoof = true
) {
	if $ipv6privacy {
		include sysprivacy::ipv6
	}
	if $macspoof {
		include sysprivacy::macspoof
	}
}