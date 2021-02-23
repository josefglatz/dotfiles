if [[ "$OSTYPE" == "darwin"* ]]; then
	alias log-stream-info="log-stream-info-process"

	# CD into my Downloads folder
	alias dl="cd $HOME/Downloads"
	# List my Downloads folder with newest first
	alias rdn="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color -t $HOME/Downloads"
		# Limit to last 10 files
		alias rdn10="rdn | head -10"
	alias rdnt="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --time-style=+%Y-%m-%d --color -t $HOME/Downloads  | grep $(date +%Y-%m-%d)"
fi