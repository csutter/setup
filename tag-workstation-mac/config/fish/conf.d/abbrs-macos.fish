# Set up abbreviations for interactive use
if status is-interactive
  abbr --add --global bbg 'brew bundle -g'

  abbr --add --global li 'limactl'
  abbr --add --global --set-cursor lic 'limactl create --tty=false --name % "template:base"'
  abbr --add --global --set-cursor lis 'ssh lima-%'
end
