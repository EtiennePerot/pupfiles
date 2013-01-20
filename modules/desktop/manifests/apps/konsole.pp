class desktop::apps::konsole {
	package {'kdebase-konsole':}
	kde_rc::merge {'konsolerc':
		source => 'desktop/apps/konsole'
	}
	if ! defined(Enduser_file['.kde4/share/apps']) {
		enduser_file {'.kde4/share/apps':
			ensure => directory
		}
	}
	enduser_file {'.kde4/share/apps/konsole':
		ensure => directory
	}
	kde_rc::merge {'Shell.profile':
		fullpath => '.kde4/share/apps/konsole/Shell.profile',
		source => 'desktop/apps/konsole'
	}
	kde_rc::merge {'Linux.colorscheme':
		fullpath => '.kde4/share/apps/konsole/Linux.colorscheme',
		source => 'desktop/apps/konsole'
	}
}