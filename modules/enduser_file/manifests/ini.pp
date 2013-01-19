define enduser_file::ini (
	$filename,
	$section = '',
	$setting,
	$value,
	$key_val_separator = '='
) {
	ini_setting {"/home/etienne/$filename/$section/$setting":
		path => "/home/etienne/$filename",
		section => $section,
		setting => $setting,
		value => $value,
		key_val_separator => $key_val_separator
	}
	ini_setting {"/root/$filename/$section/$setting":
		path => "/root/$filename",
		section => $section,
		setting => $setting,
		value => $value,
		key_val_separator => $key_val_separator
	}
}