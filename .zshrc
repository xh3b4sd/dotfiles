# Path to your oh-my-zsh installation.
export ZSH=/home/vagrant/.oh-my-zsh

# Preferred editor for local sessions
export EDITOR='vim'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="xh3b4sd"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Case-sensitive completion.
CASE_SENSITIVE="true"

# Disable command auto-correction.
DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode history-substring-search)

# Always receive unique search results.
setopt HIST_IGNORE_ALL_DUPS
# bind k and j for VI mode history substring seach
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# Enable shift-tab to access previous completion entries.
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -s '^[[Z' '\t'


# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Clear right prompt after each command. This prevents copying the command
# indicator (<<<) when copying terminal output.
setopt transientrprompt

# Prevent "zsh: file exists: <file>" warnings when redirecting using >.
setopt clobber

# Show command indicator (<<<) immediatelly (0.1s) after activating it (hitting
# ESC).
export KEYTIMEOUT=1

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ga='git add'
alias gf='FINISHED_BRANCH=$(git rev-parse --abbrev-ref HEAD); git checkout master; git pull; git branch -d $FINISHED_BRANCH' # finish and cleanup feature branch
alias tree='tree --dirsfirst'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gs='git status'
alias gcm='git commit'
alias gps='git push'
alias gpl='git pull'
alias gfc='git log $(git log --pretty=format:%H|tail -1)' # show first commit

# ls
if [[ "$(uname)" == "Darwin" ]]; then
  alias l='ls -lhG'
  alias ll='ls -lahG'
else
  alias l='ls -lh --group-directories-first --color'
  alias ll='ls -lah --group-directories-first --color'
fi

# Show current directory name as iterm tab title
autoload -Uz add-zsh-hook
function prompt_cwd_in_tab {
  echo -ne "\033]0;$(basename $(echo $PWD))\007"
}
add-zsh-hook precmd prompt_cwd_in_tab

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
