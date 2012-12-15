class base::packaging {
	package {'pacman':}
	package {'abs':}
	include base::packaging::pkgfile
	include base::packaging::multilib
}