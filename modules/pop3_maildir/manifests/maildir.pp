define pop3_maildir::maildir (
	$path = $name,
	$owner
) {
	file {"$path":
		ensure => directory,
		owner => $localuser,
		mode => 0600
	}
	file {"$path/cur":
		ensure => directory,
		owner => $localuser,
		mode => 0600
	}
	file {"$path/new":
		ensure => directory,
		owner => $localuser,
		mode => 0600
	}
	file {"$path/tmp":
		ensure => directory,
		owner => $localuser,
		mode => 0600
	}
}