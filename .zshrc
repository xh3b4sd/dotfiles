export LC_CTYPE=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Preferred editor for local sessions.
export EDITOR='atom -w'

# Vault credentials.
export VAULT_ADDR=$(cat ~/.giantswarm-vault-addr)
export VAULT_TOKEN=$(cat ~/.giantswarm-vault-token)

# Do not get annoyed by homebrew Github API magic.
export HOMEBREW_NO_GITHUB_API=true



# Add paths to look for completions.
fpath=(
  ${HOME}/projects/giantswarm/builder/completion/zsh

  ${HOME}/projects/private/anna/completion/zsh

  $fpath
)

# Add paths to look for executables.
export PATH=$PATH:${HOME}/gopath/src/github.com/giantswarm/fleet/bin
export PATH=$PATH:${HOME}/gopath/src/github.com/giantswarm/releaseit
export PATH=$PATH:${HOME}/gopath/src/github.com/giantswarm/builder
export PATH=$PATH:${HOME}/gopath/src/github.com/giantswarm/certctl

export PATH=$PATH:${HOME}/.linuxbrew/bin



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
plugins=(git vi-mode history-substring-search kubectl)



source $ZSH/oh-my-zsh.sh

# Always receive unique search results.
setopt HIST_IGNORE_ALL_DUPS
# bind k and j for VI mode history substring seach
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

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

# git
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gf='FINISHED_BRANCH=$(git rev-parse --abbrev-ref HEAD); git checkout master; git pull; git fetch -p; git branch -D $FINISHED_BRANCH' # finish and cleanup feature branch
alias gs='git status'
alias gcm='git commit'
alias gfc='git log $(git log --pretty=format:%H|tail -1)' # show first commit
alias gpl='git pull'
alias gps='git push'

# 3rd party
alias vault='docker run --rm -p 0.0.0.0:8200:8200 -ti --privileged=true -e VAULT_ADDR -e VAULT_TOKEN vault:0.6.0'

# core utils
alias l='/usr/local/bin/gls --color --group-directories-first -l --human-readable'
alias ll='/usr/local/bin/gls --color --group-directories-first -l --human-readable --all'
alias tree='tree --dirsfirst'



# Show current directory name as iterm tab title
autoload -Uz add-zsh-hook
function prompt_cwd_in_tab {
  echo -ne "\033]0;$(basename $(echo $PWD))\007"
}
add-zsh-hook precmd prompt_cwd_in_tab



# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Golang compilation arguments.
export GOPATH=~/gopath
export PATH=${PATH}:${GOPATH}/bin
export GOARCH=$(go env GOARCH)
export GOOS=$(go env GOOS)



export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
