local GPG_ENV="$HOME/.gnupg/gpg-agent-$HOST.env"
local SSH_ENV="$HOME/.ssh/environment-$HOST"
local SSHGPG_DISABLE_MARKER="$HOME/.ssh/.no-agent"
local who_am_i=$(whoami)

if [ ! -f "$SSHGPG_DISABLE_MARKER" ]; then
	if [ ! -d "$(dirname "$GPG_ENV")" ]; then
		mkdir -p "$(dirname "$GPG_ENV")"
		chmod 700 "$(dirname "$GPG_ENV")"
	fi
	if [ ! -d "$(dirname "$SSH_ENV")" ]; then
		mkdir -p "$(dirname "$SSH_ENV")"
		chmod 700 "$(dirname "$SSH_ENV")"
	fi
	if [ -f "$GPG_ENV" ]; then
		source "$GPG_ENV" > /dev/null
		if [ -n "$GPG_AGENT_INFO" ]; then
			local GPG_AGENT_PID=$(echo "$GPG_AGENT_INFO" | cut -d ':' -f 2)
			local current_process_name=$(ps -p "$GPG_AGENT_PID" -o comm=)
			local current_process_user=$(ps -p "$GPG_AGENT_PID" -o user=)
			if [ "$current_process_name" != gpg-agent -o "$current_process_user" != "$who_am_i" ]; then
				rm -f "$GPG_ENV"
			fi
		else
			rm -f "$GPG_ENV"
		fi
	fi
	if [ -f "$SSH_ENV" ]; then
		source "$SSH_ENV" > /dev/null
		if [ -n "$SSH_AGENT_PID" ]; then
			local current_process_name=$(ps -p "$SSH_AGENT_PID" -o comm=)
			local current_process_user=$(ps -p "$SSH_AGENT_PID" -o user=)
			if [ "$current_process_name" != ssh-agent -o "$current_process_user" != "$who_am_i" ]; then
				rm -f "$SSH_ENV"
			fi
		else
			rm -f "$SSH_ENV"
		fi
	fi
	if [ -f "$GPG_ENV" -a -f "$SSH_ENV" ]; then
		source "$GPG_ENV" > /dev/null
		source "$SSH_ENV" > /dev/null
		gpg-connect-agent updatestartuptty /bye &> /dev/null
	else
		/usr/bin/env gpg-agent --daemon --enable-ssh-support --allow-preset-passphrase --write-env-file "$GPG_ENV" | sed 's/^SSH_/#SSH_/' > /dev/null
		chmod 600 "$GPG_ENV"
		/usr/bin/env ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
		chmod 600 "$SSH_ENV"
		source "$GPG_ENV" > /dev/null
		source "$SSH_ENV" > /dev/null
		if [ -d "$HOME/.monkeysphere/identities" ]; then
			for identity ($HOME/.monkeysphere/identities/*); do
				base_identity=$(basename "$identity")
				# Need both --fingerprint and --with-fingerprint
				# --fingerprint shows fingerprints, --with-fingerprints shows them on subkeys as well.
				fingerprint=$(gpg --batch --with-colons --list-secret-keys --fingerprint --with-fingerprint "$base_identity" 2> /dev/null | grep -P '^fpr:' | tail -1 | cut -d ':' -f 10)
				if [ "$?" -ne 0 ]; then
					continue
				fi
				echo '#!/usr/bin/env bash' > "$identity.sh"
				chmod 700 "$identity.sh"
				read passphrase < "$identity"
				echo "echo '$passphrase'" >> "$identity.sh"
				SSH_ASKPASS="$identity.sh" MONKEYSPHERE_SUBKEYS_FOR_AGENT="$fingerprint" monkeysphere subkey-to-ssh-agent
				rm -f "$identity.sh"
			done
		fi
	fi
	export GPG_AGENT_INFO
	export SSH_AUTH_SOCK
	export SSH_AGENT_PID
	export GPG_AGENT_ENV_FILE="$GPG_ENV"
	export SSH_AGENT_ENV_FILE="$SSH_ENV"
	GPG_TTY=$(tty)
	export GPG_TTY
fi
