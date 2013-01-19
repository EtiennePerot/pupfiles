define browser (
	$browser = 'firefox'
) {
	case $browser {
		'firefox': {
			include browser::firefox
		}
		'tor-browser': {
			include browser::torbrowser
		}
	}
}