class desktop::apps::kgpg {
	package {'kdeutils-kgpg':}
	kde_rc::merge {'kgpgrc':
		source => 'desktop/apps/kgpg'
	}
}