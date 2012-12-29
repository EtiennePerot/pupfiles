class desktop::environment::kde::kcm::fonts (
	$dpi
) {
	kde_rc::ini {"kcmfonts|General|dontChangeAASettings=false":}
	kde_rc::ini {"kcmfonts|General|forceFontDPI":
		value => $dpi
	}
}