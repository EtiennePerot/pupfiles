class aur_package::yaourt {
	require base::packaging::archlinuxfr
	package {'pacman-color':}
	package {'customizepkg':}
	package {'yaourt':}
}