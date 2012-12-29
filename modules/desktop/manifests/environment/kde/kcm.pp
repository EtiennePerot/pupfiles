class desktop::environment::kde::kcm (
	$dpi
) {
	class {'desktop::environment::kde::kcm::fonts':
		dpi => $dpi
	}
	include desktop::environment::kde::kcm::input
	include desktop::environment::kde::kcm::display
}