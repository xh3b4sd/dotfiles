PROMPT='%{$fg[green]%}$%{$fg[green]%}$(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"

# print exit code on the right side of the terminal
RPS1=$RPS1' %(?..%{$fg[red]%}%?%{$reset_color%})'
