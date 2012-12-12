class base::kernel::linux_headers {
	package{'linux-headers':}
	exec { 'linux_headers_syncfirst':
		command => shellquote(
			'/usr/bin/env', 'python',
			'-c', template('base/kernel/linux_headers.py')
		),
		provider => 'posix',
		unless => "/usr/bin/env grep -P '^SyncFirst[ \\t]*=[^\\r\\n]*\\blinux-headers\\b' /etc/pacman.conf"
	}
}