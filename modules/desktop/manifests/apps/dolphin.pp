class desktop::apps::dolphin {
	package {'kdebase-dolphin':}
	package {'kdesdk-dolphin-plugins':
		require => Package['kdebase-dolphin']
	}
	kde_rc::merge {'dolphinrc':
		source => 'desktop/apps/dolphin'
	}
}