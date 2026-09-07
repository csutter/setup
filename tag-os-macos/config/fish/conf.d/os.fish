# Set up editor
set -gx EDITOR "code --wait"
set -gx VISUAL "code --wait"

# Set SSH agent socket path (some tools only read SSH config, some only read SSH_AUTH_SOCK)
set -gx SSH_AUTH_SOCK $HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# Configure and set up Homebrew
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_COLOR 1
set -gx HOMEBREW_NO_EMOJI 1
set -gx HOMEBREW_NO_INSECURE_REDIRECT 1
set -gx HOMEBREW_NO_UPDATE_REPORT_NEW 1
set -gx HOMEBREW_DISPLAY_INSTALL_TIMES 1
fish_add_path /opt/homebrew/bin

# Stop colima overwriting its own config files on startup (because we want to track it in this repo)
# Note we also set this in the env for the Homebrew service, but we may want to run colima manually
# on occasion.
set -gx COLIMA_SAVE_CONFIG 0
