homeDir="$1"
profileName="$2"
prefKey="$3"
prefValue="$4"
forceQuote="$5"
prefsJs="$homeDir/.mozilla/firefox/$profileName/prefs.js"

# Hardcore '/" switching ahead, tread carefully
existsPattern='^\s*user_pref\(\s*["'"']${prefKey}['"'"]\s*,\s*'

prefsContent=$(cat "$prefsJs" | grep -vE "$existsPattern")

quotedValue='"'"$prefValue"'"'
if [ -z "$forceQuote" ]; then
	if echo "$prefValue" | grep -E '^([0-9]+(\.[0-9]+)?|false|true|null)$' &> /dev/null; then
		quotedValue="$prefValue"
	fi
fi

prefsContent="$prefsContent
user_pref("'"'"$prefKey"'"'", $quotedValue);"

echo "$prefsContent" > "$prefsJs"
