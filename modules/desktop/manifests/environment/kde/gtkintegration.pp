class desktop::environment::kde::gtkintegration {
	include desktop::environment::kde::kcm::gtkconfig
	package {'oxygen-gtk2':}
	package {'oxygen-gtk3':}
}