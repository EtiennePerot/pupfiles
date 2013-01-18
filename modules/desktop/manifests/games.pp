class desktop::games {
	aur_package {'wine-multimedia':}
	package {'wine_gecko':
		require => Aur_package['wine-multimedia']
	}
	package {'winetricks':
		require => Aur_package['wine-multimedia']
	}
	aur_package {'steam':}
	package {'xonotic':}
}