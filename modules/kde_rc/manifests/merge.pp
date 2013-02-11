define kde_rc::merge (
	$source = false,
	$content = false,
	$filename = $name,
	$fullpath = false,
	$absolutepath = false,
	$rebuild_startup_config = false
) {
	if $rebuild_startup_config {
		include kde_rc::startupconfig
		$tonotify = [Class['kde_rc::startupconfig']]
	} else {
		$tonotify = []
	}
	require kde_rc::base
	case $source {
		false: {
			$multisource = []
		}
		/^puppet:\/\/\//: {
			$multisource = [$source]
		}
		default: {
			$multisource = [
				"puppet:///modules/private/$source/$filename",
				"puppet:///modules/$source/$filename",
				"puppet:///modules/private/$source",
				"puppet:///modules/$source"
			]
		}
	}
	if $absolutepath {
		if ! defined(File[$absolutepath]) {
			file {$absolutepath:
				ensure => present,
				notify => $tonotify
			}
		}
		if $content == false {
			ini_setting {"$absolutepath merged file $source":
				path => $absolutepath,
				source => $multisource,
				key_val_separator => '=',
				require => File[$absolutepath],
				notify => $tonotify
			}
		} else {
			$content_md5 = md5($content)
			ini_setting {"$absolutepath merged md5 $content_md5":
				path => $absolutepath,
				content => $content,
				key_val_separator => '=',
				require => File[$absolutepath],
				notify => $tonotify
			}
		}
	} else {
		if $fullpath == false {
			$final_file = ".kde4/share/config/$filename"
		} else {
			$final_file = $fullpath
		}
		if ! defined(Kde_rc[$final_file]) {
			kde_rc {$final_file:
				fullpath => $final_file,
				ensure => present,
				replace => false,
				notify => $tonotify
			}
		}
		if $content == false {
			ini_setting {"/home/etienne/$final_file merged file $source":
				path => "/home/etienne/$final_file",
				source => $multisource,
				key_val_separator => '=',
				require => Kde_rc[$final_file],
				notify => $tonotify
			}
			ini_setting {"/root/$final_file merged file $source":
				path => "/root/$final_file",
				source => $multisource,
				key_val_separator => '=',
				require => Kde_rc[$final_file],
				notify => $tonotify
			}
		} else {
			$content_md5 = md5($content)
			ini_setting {"/home/etienne/$final_file merged md5 $content_md5":
				path => "/home/etienne/$final_file",
				content => $content,
				key_val_separator => '=',
				require => Kde_rc[$final_file],
				notify => $tonotify
			}
			ini_setting {"/root/$final_file merged md5 $content_md5":
				path => "/root/$final_file",
				content => $content,
				key_val_separator => '=',
				require => Kde_rc[$final_file],
				notify => $tonotify
			}
		}
	}
}