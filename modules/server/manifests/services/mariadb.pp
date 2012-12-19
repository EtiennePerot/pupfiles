class server::services::mariadb {
	package {'mysql':
		ensure => absent
	}
	package {'libmysqlclient':
		ensure => absent
	}
	package {'mysql-clients':
		ensure => absent
	}
	package {'mariadb':
		require => Package['mysql']
	}
	package {'libmariadbclient':
		require => [Package['libmysqlclient'], Package['mariadb']]
	}
	package {'mariadb-clients':
		require => [Package['mysql-clients'], Package['mariadb']]
	}
}