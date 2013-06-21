class desktop::apps::kgpg {
	package {'kdeutils-kgpg':}
	kde_rc::merge {'kgpgrc':
		source => 'desktop/apps/kgpg'
	}
	bin_wrapper::torify {'kgpg':
		torsocks_profile => '/etc/torsocks.d/gnupg.conf'
	}
}