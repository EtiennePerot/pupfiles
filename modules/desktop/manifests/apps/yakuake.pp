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
	kde_rc::merge {'yakuake/kglobalshortcutsrc': # Global activation shortcut
		filename => 'kglobalshortcutsrc',
		source => 'desktop/apps/yakuake'
	}
	kde_autostart {'yakuake.sh':
		command => ['yakuake'],
		require => Package['yakuake']
	}
}