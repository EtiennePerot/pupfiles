class desktop::apps::keepassx {
	package {'keepassx-autoopen':}
	if ! defined (Enduser_file['.config']) {
		enduser_file {'.config':
			ensure => directory
		}
	}
	enduser_file {'.config/keepassx':
		ensure => directory
	}
	kde_rc::merge {'keepassx/config.ini':
		source => 'desktop/apps/keepassx',
		filename => 'config.ini',
		fullpath => '.config/keepassx/config.ini'
	}
	enduser_file {'.config/keepassx/start.sh':
		mode => 0700,
		content => template('desktop/apps/keepassx/start.sh.erb')
	}
	kde_autostart {'.config/keepassx/start.sh':
		simplename => 'start-keepassx.sh'
	}
}