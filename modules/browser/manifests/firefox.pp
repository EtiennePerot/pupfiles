class browser::firefox {
	package {'firefox':}
	include browser::firefox::nonewtabpage
	include browser::firefox::nofirstrun
	include browser::firefox::duckduckgo
	include browser::firefox::checkdefaultbrowser
	include browser::firefox::warnings
	include browser::firefox::greasemonkey
	include browser::firefox::httpsfinder
	include browser::firefox::requestpolicy
	include browser::firefox::stylish
	include browser::firefox::flashblock
	include browser::firefox::ui
	include browser::firefox::privacy
	include browser::firefox::network
	include browser::firefox::refcontrol
	include browser::firefox::dotsync
}