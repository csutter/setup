function fish_prompt
  set_color normal

  if set -q PROMPT_PREFIX; and test -n "$PROMPT_PREFIX"
    printf '%s ' "$PROMPT_PREFIX"
  else
    printf '%s@%s ' "$USER" (prompt_hostname)
  end

  set_color --bold brwhite
  printf '%s' (prompt_pwd)

  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_showdirtystate 1
  set -g __fish_git_prompt_showuntrackedfiles 1
  set -g __fish_git_prompt_showstashstate 1
  set -g __fish_git_prompt_showupstream auto
  set -g __fish_git_prompt_showcleanstate 1

  set -g __fish_git_prompt_color_branch white
  set -g __fish_git_prompt_color_dirtystate yellow
  set -g __fish_git_prompt_color_stagedstate green
  set -g __fish_git_prompt_color_invalidstate red
  set -g __fish_git_prompt_color_untrackedfiles red
  set -g __fish_git_prompt_color_stashstate magenta
  set -g __fish_git_prompt_color_cleanstate green
  set -g __fish_git_prompt_color_upstream yellow

  set -g __fish_git_prompt_char_stagedstate '+'
  set -g __fish_git_prompt_char_dirtystate '*'
  set -g __fish_git_prompt_char_untrackedfiles '?'
  set -g __fish_git_prompt_char_stashstate '[S]'

  set_color normal
  set -l git_info (string trim -- (fish_git_prompt))
  if test -n "$git_info"
    printf ' %s' "$git_info"
  end

  printf '# '

  set_color normal
end
