# Set up editor
set -gx EDITOR "code --wait"
set -gx VISUAL "code --wait"

# Set SSH agent socket path (some tools only read SSH config, some only read SSH_AUTH_SOCK)
set -gx SSH_AUTH_SOCK $HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# Homebrew path
fish_add_path /opt/homebrew/bin

# Stop colima overwriting its own config files on startup (because we want to track it in this repo)
# Note we also set this in the env for the Homebrew service, but we may want to run colima manually
# on occasion.
set -gx COLIMA_SAVE_CONFIG 0
