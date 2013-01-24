define network_interface::macspoof (
	$interface = $name,
	$classes
) {
	require network_interface::macspoof::base
	file {"/etc/macchiato.d/$interface.sh":
		mode => 600,
		content => template('network_interface/macspoof/macchiato_conf.sh.erb')
	}
}