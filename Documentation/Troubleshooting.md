# Troubleshooting

## defaults, plist files

### Check plist files in ~/Preferences for problematic ones with plutil

```bash
plist-check # to check
plist-delete-problematic # to delete listed plist files of command `plist-check`
```

### Live og application specific in macOS

```bash
log-stream-info "TextExpander" # to activate live log
```

### Application Crash Logs

```bash
ls -lah $HOME/Library/Logs/DiagnosticReports/
```

or open Konsole.app (Console.app) and open Crash Reports panel.