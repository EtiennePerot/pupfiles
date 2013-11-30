define bin_wrapper (
	$binary_name = $name,
	$wrapper_code = '#!/bin/bash

%ENVIRONMENT%
%PREFIX%
%EXEC_BEFORE%
%EXEC_AFTER%
exec /etc/bin-wrappers/.bin-wrap "$0" "$@"
',
	$prefix = '',
	$environment = '',
	$exec_before = '',
	$exec_after = '',
	$is_package_manager = false
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
	if $exec_before == '' {
		$actual_code3 = regsubst($actual_code2, '%EXEC_BEFORE%', '')
	} else {
		$actual_code3 = regsubst($actual_code2, '%EXEC_BEFORE%', "export BINWRAPPER_EXEC_BEFORE='$exec_before'")
	}
	if $exec_before == '' {
		if $is_package_manager {
			$actual_code4 = regsubst($actual_code3, '%EXEC_AFTER%', 'export BINWRAPPER_EXEC_AFTER="/etc/bin-wrappers/.bin-rewrap"')
		} else {
			$actual_code4 = regsubst($actual_code3, '%EXEC_AFTER%', '')
		}
	} else {
		$actual_code4 = regsubst($actual_code3, '%EXEC_AFTER%', "export BINWRAPPER_EXEC_AFTER='$exec_after'")
	}
	file {"/etc/bin-wrappers/$name":
		owner => 'root',
		group => 'root',
		mode => 0755,
		content => $actual_code4
	}
}