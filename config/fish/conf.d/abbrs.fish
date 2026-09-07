# Set up abbreviations for interactive use
if status is-interactive
  abbr --add --global g 'git'
  abbr --add --global ga 'git add'
  abbr --add --global gb 'git branch'
  abbr --add --global gca 'git commit --amend'
  abbr --add --global gcaa 'git commit --amend --no-edit'
  abbr --add --global gcm 'git commit -m'
  abbr --add --global gco 'git checkout'
  abbr --add --global gd 'git diff'
  abbr --add --global gds 'git diff --staged'
  abbr --add --global gl 'git log'
  abbr --add --global glo 'git log --oneline'
  abbr --add --global gst 'git status'
  abbr --add --global gu 'git pull'
  abbr --add --global gp 'git push'
  abbr --add --global grs 'git-resign'

  abbr --add --global prc 'gh pr create --fill'
  abbr --add --global prm 'gh pr merge -d'

  abbr --add --global d 'docker'
  abbr --add --global tf 'terraform'

  abbr --add --global path 'printf "%s\\n" $PATH'
end
