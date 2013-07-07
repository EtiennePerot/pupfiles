class base (
	$networking = true
) {
	include base::root
	include base::nobeep
	include base::packaging
	include base::timekeeping
	include base::sudo
	include base::filesystem
	include base::python
	if $networking {
		include base::networking
	}
}