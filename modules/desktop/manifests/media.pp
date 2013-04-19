class desktop::media {
	package {'amarok':}
	package {'vlc':}
	package {'ffmpeg':}
	include desktop::media::mplayer
	package {'mencoder':}
	package {'mkvtoolnix-cli':}
	package {'mkvtoolnix-gtk':}
	package {'handbrake-cli':}
	package {'handbrake':}
	package {'picard':}
	package {'audacity':}
	package {'kdenlive':}
	aur_package {'paman':}
	aur_package {'pavucontrol':}
	aur_package {'freetuxtv':}
}