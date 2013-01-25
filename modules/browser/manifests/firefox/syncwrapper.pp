class browser::firefox::syncwrapper {
	file {'/usr/bin/firefox':
		mode => 755,
		source => 'puppet:///modules/browser/firefox/syncwrapper/firefox.sh'
	}
}