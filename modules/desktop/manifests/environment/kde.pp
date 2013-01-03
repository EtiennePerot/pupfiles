class desktop::environment::kde (
	$dpi
) {
	# Replace akonadi's mysql with mariadb
	# To do this properly we should install mariadb before installing KDE,
	# hence the "require" here
	require server::services::mariadb

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

	include desktop::environment::kde::globals
	class {'desktop::environment::kde::kcm':
		dpi => $dpi,
		require => Class['desktop::environment::kde::globals']
	}
	include desktop::environment::kde::notify
	include desktop::environment::kde::klipper
	include desktop::environment::kde::kmix
	include desktop::environment::kde::kwallet
	include desktop::environment::kde::kwin
	include desktop::environment::kde::themes
	include desktop::environment::kde::systemsettings
	include desktop::environment::kde::krunner
}