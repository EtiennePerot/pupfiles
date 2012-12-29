class desktop::environment::kde::kcm::cddb {
	kde_rc::merge {'kcmcddbrc':
		source => 'desktop/environment/kde/kcm/cddb'
	}
}