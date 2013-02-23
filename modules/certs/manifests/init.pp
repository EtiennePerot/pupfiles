class certs {
	package {'ca-certificates':}
	certs::cert {'RiseupCA.pem':}
	certs::cert {'CAcert-root.pem':}
	certs::cert {'CAcert-class3.pem':}
}