define bin_wrapper (
	$binary_name = $name,
	$wrapper_code = '#!/bin/bash

%ENVIRONMENT%
%PREFIX%
exec /etc/bin-wrappers/.bin-wrap "$0" "$@"
',
	$prefix = '',
	$environment = ''
) {
	require bin_wrapper::base
	if $prefix == '' {
		$actual_code = regsubst($wrapper_code, '%PREFIX%', '')
	} else {
		$actual_code = regsubst($wrapper_code, '%PREFIX%', "export BINWRAPPER_PREFIX='$prefix'")
	}
	if $environment == '' {
		$actual_code2 = regsubst($actual_code, '%ENVIRONMENT%', '')
	} else {
		$actual_code2 = regsubst($actual_code, '%ENVIRONMENT%', "export $environment")
	}
	file {"/etc/bin-wrappers/$name":
		owner => 'root',
		group => 'root',
		mode => 0755,
		content => $actual_code2
	}
}