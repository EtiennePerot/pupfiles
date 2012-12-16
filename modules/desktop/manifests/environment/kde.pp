class desktop::environment::kde {
	package {'kdebase-workspace':}
	package {'kde-meta-kdeaccessibility':}
	package {'kde-meta-kdeadmin':}
	package {'kde-meta-kdeartwork':}
	package {'kde-meta-kdebase':}
	package {'kde-meta-kdeedu':}
	package {'kde-meta-kdegames':}
	package {'kde-meta-kdegraphics':}
	package {'kde-meta-kdemultimedia':}
	package {'kde-meta-kdenetwork':}
	package {'kde-meta-kdepim':}
	package {'kde-meta-kdeplasma-addons':}
	package {'kde-meta-kdesdk':}
	package {'kde-meta-kdetoys':}
	package {'kde-meta-kdeutils':}
	package {'kde-meta-kdewebdev':}
	package {'kde-wallpapers':}
	systemd_service {'kdm':
		require => Package['kdebase-workspace']
	}
}