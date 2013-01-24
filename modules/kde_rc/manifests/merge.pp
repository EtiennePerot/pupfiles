define kde_rc::merge (
	$source = false,
	$content = false,
	$filename = $name,
	$fullpath = false,
	$absolutepath = false
) {
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
				"puppet:///modules/$source/$filename"
			]
		}
	}
	if $absolutepath {
		if ! defined(File[$absolutepath]) {
			file {$absolutepath:
				ensure => present
			}
		}
		if $content == false {
			ini_setting {"$absolutepath merged file $source":
				path => $absolutepath,
				source => $multisource,
				key_val_separator => '=',
				require => File[$absolutepath]
			}
		} else {
			$content_md5 = md5($content)
			ini_setting {"$absolutepath merged md5 $content_md5":
				path => $absolutepath,
				content => $content,
				key_val_separator => '=',
				require => File[$absolutepath]
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
				replace => false
			}
		}
		if $content == false {
			ini_setting {"/home/etienne/$final_file merged file $source":
				path => "/home/etienne/$final_file",
				source => $multisource,
				key_val_separator => '=',
				require => Kde_rc[$final_file]
			}
			ini_setting {"/root/$final_file merged file $source":
				path => "/root/$final_file",
				source => $multisource,
				key_val_separator => '=',
				require => Kde_rc[$final_file]
			}
		} else {
			$content_md5 = md5($content)
			ini_setting {"/home/etienne/$final_file merged md5 $content_md5":
				path => "/home/etienne/$final_file",
				content => $content,
				key_val_separator => '=',
				require => Kde_rc[$final_file]
			}
			ini_setting {"/root/$final_file merged md5 $content_md5":
				path => "/root/$final_file",
				content => $content,
				key_val_separator => '=',
				require => Kde_rc[$final_file]
			}
		}
	}
}