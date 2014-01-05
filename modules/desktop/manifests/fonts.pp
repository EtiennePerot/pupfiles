class desktop::fonts {
	package {'ttf-dejavu':}
	package {'ttf-liberation':}
	package {'ttf-opensans':}
	package {'ttf-microsoft-consolas':}
	package {'ttf-source-code-pro':}
	package {'ttf-droid':}
	package {'ttf-roboto':}

	# Inconsolata
	package {'ttf-inconsolata':}
	package {'ttf-inconsolata-dz':}
	font {'InconsolataPlus0Bold.ttf':
		source => 'desktop/fonts/inconsolata_plus'
	}
	font {'InconsolataPlus0DemiBold.ttf':
		source => 'desktop/fonts/inconsolata_plus'
	}
	font {'InconsolataPlus0Medium.ttf':
		source => 'desktop/fonts/inconsolata_plus'
	}

	# Stencil
	font {'Stencil.ttf':
		source => 'desktop/fonts/stencil'
	}

	# Team Fortress 2
	font {'TF2.ttf':
		source => 'desktop/fonts/tf2'
	}
	font {'TF2Build.ttf':
		source => 'desktop/fonts/tf2'
	}
	font {'TF2secondary.ttf':
		source => 'desktop/fonts/tf2'
	}

	# Meiryo
	font {'Meiryo.ttc':
		source => 'desktop/fonts/meiryo'
	}
	font {'Meiryob.ttc':
		source => 'desktop/fonts/meiryo'
	}
}
