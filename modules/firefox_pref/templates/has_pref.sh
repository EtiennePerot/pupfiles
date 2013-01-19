homeDir="$1"
profileName="$2"
prefKey="$3"
prefValue="$4"
forceQuote="$5"
prefsJs="$homeDir/.mozilla/firefox/$profileName/prefs.js"

# Hardcore '/" switching ahead, tread carefully
if [ -n "$forceQuote" ]; then
	pattern='^\s*user_pref\(\s*["'"']${prefKey}['"'"]\s*,\s*["'"']${prefValue}['"'"]\s*\);?\s*$'
else
	pattern='^\s*user_pref\(\s*["'"']${prefKey}['"'"]\s*,\s*["'"']?${prefValue}['"'"]?\s*\);?\s*$'
fi

exec grep -E "$pattern" "$prefsJs" &> /dev/null
