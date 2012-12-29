class desktop::apps::kate {
	include desktop::fonts
	package {'kdebase-katepart':}
	package {'kdesdk-kate':}
	kde_rc::merge {'katerc':
		source => 'desktop/apps/kate'
	}
	kde_rc::merge {'kateschemarc':
		source => 'desktop/apps/kate',
		require => Class['desktop::fonts']
	}
	kde_rc::merge {'katepartpluginsrc':
		source => 'desktop/apps/kate'
	}
}