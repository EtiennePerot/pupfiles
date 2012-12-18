define gpg_key (
	$source,
	$user
) {
	require gpg_key::base
	exec {"Import key $name":
		command => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('gpg_key/import_key.sh.erb'),
			'import_key.sh', template("private/$source")
		),
		unless => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('gpg_key/has_key.sh.erb'),
			'has_key.sh', template("private/$source")
		),
		user => $user,
		provider => 'shell'
	}
}