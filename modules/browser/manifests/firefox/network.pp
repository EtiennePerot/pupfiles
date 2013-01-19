class browser::firefox::network {
	firefox_pref {'network.http.pipelining':
		value => true
	}
	firefox_pref {'network.http.pipelining.maxrequests':
		value => 64
	}
	firefox_pref {'network.http.pipelining.ssl':
		value => true
	}
	firefox_pref {'network.http.proxy.pipelining':
		value => true
	}
}