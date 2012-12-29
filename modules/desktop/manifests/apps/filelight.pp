class desktop::apps::filelight {
	package {'kdeutils-filelight':}
	kde_rc::merge {'filelightrc':
		source => 'desktop/apps/filelight'
	}
}