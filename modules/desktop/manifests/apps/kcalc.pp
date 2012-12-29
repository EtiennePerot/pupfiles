class desktop::apps::kcalc {
	package {'kdeutils-kcalc':}
	kde_rc::merge {'kcalcrc':
		source => 'desktop/apps/kcalc'
	}
}