define firefox_pref (
	$profile = 'default',
	$key = $name,
	$value,
	$hasquotes = ''
) {
	if ! defined(Firefox_profile[$profile]) {
		firefox_profile {$profile:}
	}
	exec {"etienne Firefox $profile - Set $key":
		command => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/set_pref.sh'),
			'set_pref.sh', '/home/etienne', $profile, $key, $value, $hasquotes
		),
		unless => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/has_pref.sh'),
			'has_pref.sh', '/home/etienne', $profile, $key, $value, $hasquotes
		),
		provider => 'shell'
	}
}