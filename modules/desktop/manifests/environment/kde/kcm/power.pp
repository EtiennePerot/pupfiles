class desktop::environment::kde::kcm::power (
	$laptop
) {
	if $laptop {
		kde_rc::merge {'powerdevilrc':
			source => 'desktop/environment/kde/kcm/power/laptop.powerdevilrc'
		}
		kde_rc::merge {'powermanagementprofilesrc':
			source => 'desktop/environment/kde/kcm/power/laptop.powermanagementprofilesrc'
		}
	} else {
		kde_rc::merge {'powermanagementprofilesrc':
			source => 'desktop/environment/kde/kcm/power/desktop.powermanagementprofilesrc'
		}
	}
}