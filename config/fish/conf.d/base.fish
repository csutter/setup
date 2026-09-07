# Suppress the built-in welcome message
set -g fish_greeting ''

# Make sure XDG_CONFIG_HOME is always set
set -gx XDG_CONFIG_HOME $HOME/.config

# Set up local tools folder
fish_add_path $HOME/.local/bin
