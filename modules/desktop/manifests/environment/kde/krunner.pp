class desktop::environment::kde::krunner {
	kde_rc::merge {'krunner/kglobalshortcutsrc':
		filename => 'kglobalshortcutsrc',
		source => 'desktop/environment/kde/krunner'
	}
}