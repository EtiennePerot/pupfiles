define akonadi_resource::imap (
	$email = $name,
	$username = false,
	$server = false,
	$resourcename = false,
	$inbox = '.INBOX',
	$sievesupport = true,
	$subscriptionenabled = true,
	$disconnectenabled = true
) {
	require akonadi_resource
	$actualemail = regsubst(regsubst($email, '\s*\(at\)\s*', '@'), '\s*\(dot\)\s*', '.')
	if $server == false {
		$actualserver = regsubst($actualemail, '^.*@', '')
	} else {
		$actualserver = $server
	}
	if $username == false {
		$actualusername = $actualemail
	} else {
		$actualusername = $username
	}
	if $resourcename == false {
		$actualresourcename = regsubst(regsubst($actualemail, '@', '-at-'), '\.', '-dot-')
	} else {
		$actualresourcename = $resourcename
	}
	$fileresourcename = "akonadi_imap_resource_${actualresourcename}rc"
	kde_rc::merge {$fileresourcename:
		content => template('akonadi_resource/imap.ini.erb')
	}
	kde_rc::ini {"special:akonadi-agentsrc|Instances|akonadi_imap_resource_${actualresourcename}\\AgentType=akonadi_imap_resource":
		fullpath => '.config/akonadi/agentsrc',
		require => Kde_rc::Merge[$fileresourcename]
	}
	kde_rc::ini {"special:akonadi_imap_resource_${actualresourcename}|Agent|Name":
		value => $actualemail,
		fullpath => ".config/akonadi/agent_config_akonadi_imap_resource_$actualresourcename",
		require => Kde_rc::Merge[$fileresourcename]
	}
}