class desktop::graphics::intel {
	package {'xf86-video-intel':}
	package {'libva-intel-driver':}
	package {'intel-dri':}
	package {'driconf':}
	include base::packaging::multilib
	package {'lib32-intel-dri':
		require => Class['base::packaging::multilib']
	}
	include base::mkinitcpio
	$i915_command = shellquote(
		'/usr/bin/env', 'echo',
		'MODULES="$MODULES i915"'
	)
	exec {'/etc/mkinitcpio.conf/modules/i915':
		command => "$i915_command >> /etc/mkinitcpio.conf",
		unless => shellquote(
			'/usr/bin/env', 'grep', '-P',
			'^MODULES="\$MODULES i915"$',
			'/etc/mkinitcpio.conf'
		),
		notify => Exec['mkinitcpio']
	}
	include desktop::xorg
	file {'/etc/X11/xorg.conf.d/20-intel.conf':
		source => 'puppet:///modules/desktop/graphics/intel/20-intel.conf',
		require => Class['desktop::xorg']
	}
	enduser_file {'.drirc':
		source => 'desktop/graphics/intel'
	}
}