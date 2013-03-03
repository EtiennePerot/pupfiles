class browser::firefox::launcher {
	file {'/usr/bin/firefox':
		mode => 755,
		source => 'puppet:///modules/browser/firefox/launcher/firefox.sh'
	}
}