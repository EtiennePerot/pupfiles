class desktop::apps::yakuake {
	package {'yakuake':}
	aur_package {'yakuake-skin-plasma-oxygen-panel':
		require => Package['yakuake']
	}
	kde_rc::merge {'yakuakerc':
		source => 'desktop/apps/yakuake',
		require => Aur_package['yakuake-skin-plasma-oxygen-panel']
	}
	kde_rc::merge {'yakuake.notifyrc':
		source => 'desktop/apps/yakuake'
	}
	kde_rc::merge {'kglobalshortcutsrc': # Global activation shortcut
		source => 'desktop/apps/yakuake'
	}
}