class desktop::environment::kde::kcm::fonts (
	$dpi
) {
	require desktop::fonts
	kde_rc::ini {'kcmfonts|General|dontChangeAASettings=false':
		rebuild_startup_config => true
	}
	kde_rc::ini {'kcmfonts|General|forceFontDPI':
		value => $dpi,
		rebuild_startup_config => true
	}
}