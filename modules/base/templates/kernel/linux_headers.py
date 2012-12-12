import os
try:
	import configparser
except ImportError:
	import ConfigParser as configparser

config = configparser.SafeConfigParser(allow_no_value=True)
config.optionxform = lambda x: x # Not case-insensitive
config.read('/etc/pacman.conf')
if not config.has_section('options'):
	config.add_section('options')
syncFirst = ['pacman']
if config.has_option('options', 'SyncFirst'):
	syncFirst = config.get('options', 'SyncFirst').split()
if 'linux-headers' not in syncFirst:
	syncFirst.append('linux-headers')
config.set('options', 'SyncFirst', ' '.join(syncFirst))
outputFile = open('/etc/pacman.conf', 'w')
config.write(outputFile)
outputFile.close()
