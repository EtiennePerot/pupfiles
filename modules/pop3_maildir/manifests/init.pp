define pop3_maildir (
	$maildir = $name,
	$inbox_folder = 'Inbox',
	$sent_folder = 'Sent',
	$stubdir = '/tmp',
	$pop3_server,
	$pop3_user,
	$pop3_password,
	$localuser,
	$sieve = '',
	$cron_hour = '*',
	$cron_minute = '*/20',
	$cron_randomdelay = 900, # 15 minutes = 900 seconds
	$torify = true
) {
	require pop3_maildir::restore_stub_dir
	if ! defined(Package['getmail']) {
		package {'getmail':}
	}
	if ! defined(Package['mailutils']) {
		package {'mailutils':}
	}
	if ! defined(Package['rsync']) {
		package {'rsync':}
	}
	file {$maildir:
		ensure => directory,
		owner => $localuser,
		mode => 0600
	}
	pop3_maildir::maildir {"$maildir/$inbox_folder":
		owner => $localuser
	}
	pop3_maildir::maildir {"$maildir/$sent_folder":
		owner => $localuser
	}
	file {"$maildir/.getmail":
		ensure => directory,
		owner => $localuser,
		mode => 0600
	}
	file {"$maildir/.sieve":
		owner => $localuser,
		mode => 0600,
		content => $sieve
	}
	file {"$maildir/.cron.sh":
		owner => $localuser,
		mode => 0700,
		content => template('pop3_maildir/cron.sh.erb')
	}
	cron {"$maildir/.cron.sh":
		command => "$maildir/.cron.sh",
		user => $localuser,
		hour => $cron_hour,
		minute => $cron_minute,
		monthday => '*',
		month => '*',
		weekday => '*',
		require => File["$maildir/.cron.sh"]
	}
}