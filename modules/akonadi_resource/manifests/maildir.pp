define akonadi_resource::maildir (
	$email = $name,
	$maildir,
	$resourcename = false
) {
	require akonadi_resource
	$actualemail = regsubst(regsubst($email, '\s*\(at\)\s*', '@'), '\s*\(dot\)\s*', '.')
	if $resourcename == false {
		$actualresourcename = regsubst(regsubst($actualemail, '@', '-at-'), '\.', '-dot-')
	} else {
		$actualresourcename = $resourcename
	}
	$fileresourcename = "akonadi_maildir_resource_${actualresourcename}rc"
	kde_rc::merge {$fileresourcename:
		content => template('akonadi_resource/maildir.ini.erb')
	}
	kde_rc::ini {"special:akonadi-agentsrc|Instances|akonadi_maildir_resource_${actualresourcename}\\AgentType=akonadi_maildir_resource":
		fullpath => '.config/akonadi/agentsrc',
		require => Kde_rc::Merge[$fileresourcename]
	}
	kde_rc::ini {"special:akonadi_imap_resource_${actualresourcename}|Agent|Name":
		value => $actualemail,
		fullpath => ".config/akonadi/agent_config_akonadi_maildir_resource_$actualresourcename",
		require => Kde_rc::Merge[$fileresourcename]
	}
}