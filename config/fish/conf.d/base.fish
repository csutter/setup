# Suppress the built-in welcome message
set -g fish_greeting ''

# Set up editor
set -gx EDITOR "vim"
set -gx VISUAL "vim"

# Set up local tools folder
fish_add_path $HOME/.local/bin
