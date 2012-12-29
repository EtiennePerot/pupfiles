class desktop::environment::kde::kcm (
	$dpi
) {
	class {'desktop::environment::kde::kcm::fonts':
		dpi => $dpi
	}
}