class browser::firefox {
	package {'firefox':}
	include browser::firefox::launcher
	include browser::firefox::newtabpage
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
	include browser::firefox::uacontrol
	include browser::firefox::dotsync
	include browser::firefox::betterprivacy
	include browser::firefox::cookiewhitelistwithbuttons
	include browser::firefox::selfdestructingcookies
	include browser::firefox::fonts
	include browser::firefox::sync
}