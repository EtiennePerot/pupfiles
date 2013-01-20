class desktop::environment::kde::kcm::qtgraphicssystem {
	aur_package {'kcm-qt-graphicssystem':}
	if ! defined(Enduser_file['.kde4/env']) {
		enduser_file {'.kde4/env':
			ensure => directory
		}
	}
	enduser_file {'.kde4/env/qt-graphicssystem.sh':
		filename => 'qt-graphicssystem.sh',
		mode => 0700,
		source => 'desktop/environment/kde/kcm/qtgraphicssystem'
	}
}