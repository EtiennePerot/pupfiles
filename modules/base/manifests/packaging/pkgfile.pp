class base::packaging::pkgfile {
	package {'pkgfile':}
	exec {'pkgfile --update':
		command => shellquote(
			'/usr/bin/env',
			'pkgfile', '--update'
		),
		unless => shellquote(
			'/usr/bin/env',
			'test', '-d',
			'/var/cache/pkgfile'
		),
		require => Package['pkgfile']
	}
}