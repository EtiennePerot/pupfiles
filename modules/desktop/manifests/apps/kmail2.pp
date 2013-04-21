class desktop::apps::kmail2 {
	package {'kdepim-kmail':}
	enduser_file {'.kmail_signature':
		mode => 0700,
		source => 'desktop/apps/kmail2'
	}
	kde_rc::merge {'kmail2rc':
		source => 'desktop/apps/kmail2'
	}
	kde_rc {'kmailrc':
		source => 'desktop/apps/kmail2'
	}
	kde_rc {'kmail.eventsrc':
		source => 'desktop/apps/kmail2'
	}
	kde_rc {'emaildefaults':
		source => 'desktop/apps/kmail2'
	}
	kde_rc {'emailidentities':
		source => 'desktop/apps/kmail2'
	}
	kde_rc {'mailtransports':
		source => 'desktop/apps/kmail2'
	}
	akonadi_resource::imap {'etienne (at) perot (dot) me':}
	include private::desktop::apps::kmail2 # Defines a few pop3_maildir's
}