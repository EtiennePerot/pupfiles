class desktop::xorg {
	package {'xorg-server':}
	package {'xorg-xrandr':}
	package {'xorg-xkill':}
	package {'xorg-xmodmap':}
	package {'xorg-mkfontdir':}
	package {'xorg-mkfontscale':}
}