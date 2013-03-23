class base::packaging {
	package {'pacman':}
	package {'abs':}
	package {'namcap':}
	include base::packaging::pkgfile
	include base::packaging::multilib
	include base::packaging::armh
}