define firefox_pref (
	$profile = 'Default',
	$key = $name,
	$value,
	$hasquotes = '',
	$isdefault = false
) {
	require browser::firefox::profile
	if $value == true {
		$actual_value = 'true'
	} else {
		if $value == false {
			$actual_value = 'false'
		} else {
			$actual_value = $value
		}
	}
	if $isdefault {
		$actual_isdefault = 'true'
	} else {
		$actual_isdefault = 'false'
	}
	exec {"etienne Firefox $profile - Set $key":
		command => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/set_pref.sh.erb'),
			'set_pref.sh', '/home/etienne', $profile, $key, $actual_value, $hasquotes, $actual_isdefault
		),
		unless => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/has_pref.sh.erb'),
			'has_pref.sh', '/home/etienne', $profile, $key, $actual_value, $hasquotes, $actual_isdefault
		),
		provider => 'shell'
	}
	exec {"root Firefox $profile - Set $key":
		command => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/set_pref.sh.erb'),
			'set_pref.sh', '/root', $profile, $key, $actual_value, $hasquotes, $actual_isdefault
		),
		unless => shellquote(
			'/usr/bin/env', 'bash',
			'-c', template('firefox_pref/has_pref.sh.erb'),
			'has_pref.sh', '/root', $profile, $key, $actual_value, $hasquotes, $actual_isdefault
		),
		provider => 'shell'
	}
}