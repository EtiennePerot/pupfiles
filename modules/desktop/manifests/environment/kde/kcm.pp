class desktop::environment::kde::kcm (
	$dpi,
	$laptop
) {
	class {'desktop::environment::kde::kcm::fonts':
		dpi => $dpi
	}
	include desktop::environment::kde::kcm::input
	include desktop::environment::kde::kcm::display
	include desktop::environment::kde::kcm::cddb
	include desktop::environment::kde::kcm::qtgraphicssystem
	include desktop::environment::kde::kcm::gtkconfig
	class {'desktop::environment::kde::kcm::power':
		laptop => $laptop
	}
}