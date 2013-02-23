define certs::cert (
	$filename = $name,
	$destination = '/etc/ssl/certs'
) {
	file {"$destination/$filename":
		source => "puppet:///modules/certs/$filename"
	}
}