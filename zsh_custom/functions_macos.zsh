if [[ "$OSTYPE" == "darwin"* ]]; then
	# Live syslog on specific process
    # -------------------------------------------------
    # e.g. `log-stream-info-process "TextExpander"`
    function log-stream-info-process {
        log stream --info --predicate 'process=="$1"'
    }
fi