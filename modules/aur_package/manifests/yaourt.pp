class aur_package::yaourt {
	require base::packaging::archlinuxfr
	package {'customizepkg':}
	package {'yaourt':}
}