define firefox_pref (
	$profile = 'default',
	$key = $name,
	$value,
	$hasquotes = ''
) {
	if ! defined(Firefox_profile[$profile]) {
		firefox_profile {$profile:}
	}
	if $value == true {
		$actual_value = 'true'
	} else {
		if $value == false {
			$actual_value = 'false'
		} else {
			$actual_value = $value
		}
	}
	exec {"etienne Firefox $profile - Set $key":
		command => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/set_pref.sh'),
			'set_pref.sh', '/home/etienne', $profile, $key, $actual_value, $hasquotes
		),
		unless => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/has_pref.sh'),
			'has_pref.sh', '/home/etienne', $profile, $key, $actual_value, $hasquotes
		),
		provider => 'shell'
	}
	exec {"root Firefox $profile - Set $key":
		command => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/set_pref.sh'),
			'set_pref.sh', '/root', $profile, $key, $actual_value, $hasquotes
		),
		unless => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/has_pref.sh'),
			'has_pref.sh', '/root', $profile, $key, $actual_value, $hasquotes
		),
		provider => 'shell'
	}
}