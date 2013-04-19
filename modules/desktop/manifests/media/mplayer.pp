class desktop::media::mplayer {
	package {'mplayer':}
	package {'smplayer':}
	enduser_file {'.mplayer':
		ensure => directory
	}
	enduser_file {'.mplayer/config':
		source => 'desktop/media/mplayer'
	}
}