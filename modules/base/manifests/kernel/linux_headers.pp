class base::kernel::linux_headers {
	package {'linux-headers':}
	# This would benefit a lot from ini_setting
	# Sadly it requires more logic than that in order to add a package
	# to a line, rather than just setting that line to some fixed value
	exec {'linux_headers_syncfirst':
		command => shellquote(
			'/usr/bin/env', 'python',
			'-c', template('base/kernel/linux_headers.py')
		),
		provider => 'posix',
		unless => shellquote('/usr/bin/env', 'grep', '-P',
			'^SyncFirst[ \t]*=[^\r\n]*\blinux-headers\b',
			'/etc/pacman.conf'
		)
	}
}