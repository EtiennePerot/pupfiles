class console (
	$rtorrent = false
) {
	include console::ssh
	include console::screen
	include console::git
	include console::pager
	include console::shutils
	include console::oh_my_zsh
	if $rtorrent {
		include console::rtorrent
	}
}