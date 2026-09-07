# Ensure Homebrew casks get installed into user applications directory, not system-wide
set -gx HOMEBREW_CASK_OPTS "--appdir=/Users/$USER/Applications"

# Skip installing casks that don't work on this machine
set -gx HOMEBREW_BUNDLE_CASK_SKIP "linearmouse"
