class browser::firefox::sync {
	firefox_pref {'services.sync.client.name':
		value => "$hostname - operatingsystem"
	}
	firefox_pref {'services.sync.addons.trustedSourceHostnames':
		value => 'addons.mozilla.org,eff.org,www.eff.org'
	}
}