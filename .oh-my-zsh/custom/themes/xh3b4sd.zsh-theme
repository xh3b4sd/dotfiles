PROMPT='%{$fg[green]%}%n@%M%{$fg[green]%}%{$fg[blue]%}$(git_prompt_info)%{$fg[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

# print exit code on the right side of the terminal
RPS1=$RPS1' $(vi_mode_prompt_info) %(?..%{$fg[red]%}%?%{$reset_color%})'
