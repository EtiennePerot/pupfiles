class server::services::mariadb (
	$service = false
) {
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
	if $service != false {
		systemd_service {'mysqld':
			require => Package['mariadb']
		}
	}
}