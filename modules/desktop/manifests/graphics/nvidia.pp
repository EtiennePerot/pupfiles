class desktop::graphics::nvidia {
	package {'nvidia':}
	package {'nvidia-utils':}
	include base::packaging::multilib
	package {'lib32-nvidia-utils':
		require => Class['base::packaging::multilib']
	}
}