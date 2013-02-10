# Per-directory environment files
cd() {
	builtin cd "$@"
	if [ -x .env ]; then
		source .env
	fi
}
