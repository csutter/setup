# These are also set in the fish config overrides, but we need it here for bootstrapping before the
# dotfiles are applied for the first time.
export HOMEBREW_CASK_OPTS=--appdir=/Users/$(USER)/Applications
export HOMEBREW_BUNDLE_CASK_SKIP=linearmouse

# Don't try to change the shell on this thing as we can't
SETUP_SKIP_SET_SHELL := 1
