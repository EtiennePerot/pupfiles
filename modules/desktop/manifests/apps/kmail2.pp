class desktop::apps::kmail2 {
	package {'kdepim-kmail':}
	enduser_file {'.kmail_signature':
		mode => 0700,
		source => 'puppet:///modules/desktop/apps/kmail2/.kmail_signature'
	}
	# TODO: ini_setting in kmail2rc for .kmail_signature
}