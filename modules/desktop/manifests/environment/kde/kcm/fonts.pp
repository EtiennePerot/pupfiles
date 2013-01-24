class desktop::environment::kde::kcm::fonts (
	$dpi
) {
	require desktop::fonts
	kde_rc::ini {'kcmfonts|General|dontChangeAASettings=false':}
	kde_rc::ini {'kcmfonts|General|forceFontDPI':
		value => $dpi
	}
}