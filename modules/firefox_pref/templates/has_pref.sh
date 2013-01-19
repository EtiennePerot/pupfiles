homeDir="$1"
profileName="$2"
prefKey="$3"
prefValue="$4"
forceQuote="$5"
prefsJs="$homeDir/.mozilla/firefox/$profileName/prefs.js"

# Hardcore '/" switching ahead, tread carefully
existsPattern='^\s*user_pref\(\s*["'"']${prefKey}['"'"]\s*,\s*'
if ! grep -E "$pattern" "$prefsJs" &> /dev/null; then
	echo sdfd
	exit 1
fi

matchingLine=$(grep -E "$existsPattern" "$prefsJs")
matchingPart=$(grep -oE "$existsPattern" "$prefsJs")
matchingPartSize="${#matchingPart}"
currentPrefValue=$(echo "${matchingLine:$matchingPartSize}" | sed -r 's/["'"'"']?\s*\)\s*;?\s*$//' | sed -r 's/^\s*["'"'"']?//')

if [ "$currentPrefValue" != "$prefValue" ]; then
	exit 1
else
	exit 0
fi
