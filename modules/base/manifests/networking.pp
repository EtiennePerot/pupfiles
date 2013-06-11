class base::networking {
	include base::networking::tor
	package {'dnsutils':} # dig
	package {'net-tools':} # netstat
	package {'openbsd-netcat':} # netcat
	package {'iputils':} # ping
	package {'traceroute':}
	aur_package {'tcptraceroute':}
	package {'openssh':}
	package {'rsync':}
	package {'nmap':}
	package {'tcpdump':}
	include private::base::networking::hosts
	include private::base::networking::udevrenamedevices
	include private::base::networking::tunnels
}