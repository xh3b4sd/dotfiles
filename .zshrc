export LC_CTYPE=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Preferred editor for local sessions.
export EDITOR='atom -w'

# Do not get annoyed by homebrew Github API magic.
export HOMEBREW_NO_GITHUB_API=true

# Do not edit git merge messages in editors.
export=GIT_MERGE_AUTOEDIT=no



# az
export AZURE_CLIENT_ID=$(cat ~/.credential/azure-client-id)
export AZURE_CLIENT_SECRET=$(cat ~/.credential/azure-client-secret)
export AZURE_LOCATION=$(cat ~/.credential/azure-location)
export AZURE_SUBSCRIPTION_ID=$(cat ~/.credential/azure-subscription-id)
export AZURE_TENANT_ID=$(cat ~/.credential/azure-tenant-id)

# ci-cleaner
export CI_CLEANER_AWS_ACCESS_KEY_ID=$(cat ~/.credential/ci-cleaner-aws-access-key-id)
export CI_CLEANER_AWS_SECRET_ACCESS_KEY=$(cat ~/.credential/ci-cleaner-aws-secret-access-key)

# opsctl
export OPSCTL_AWS_ACCESS_KEY_ID=$(cat ~/.credential/opsctl-aws-access-key-id)
export OPSCTL_AWS_SECRET_ACCESS_KEY=$(cat ~/.credential/opsctl-aws-secret-access-key)
export OPSCTL_GITHUB_TOKEN=$(cat ~/.credential/opsctl-github-token)
export OPSCTL_GPG_PASSWORD=$(cat ~/.credential/opsctl-gpg-password)
export OPSCTL_OPSGENIE_TOKEN=$(cat ~/.credential/opsctl-opsgenie-token)

# github-exporter
export GITHUB_EXPORTER_GITHUB_TOKEN=$(cat ~/.credential/github-exporter-github-token)

# github-tweeter
export GITHUB_TWEETER_GITHUB_TOKEN=$(cat ~/.credential/github-tweeter-github-token)

# twitter
export TWITTER_CONSUMER_KEY=$(cat ~/.credential/twitter-consumer-key)
export TWITTER_CONSUMER_SECRET=$(cat ~/.credential/twitter-consumer-secret)
export TWITTER_ACCESS_TOKEN=$(cat ~/.credential/twitter-access-token)
export TWITTER_ACCESS_SECRET=$(cat ~/.credential/twitter-access-secret)



# Add paths to look for completions.
fpath=(
  ${HOME}/projects/giantswarm/builder/completion/zsh

  ${HOME}/projects/private/anna/completion/zsh

  $fpath
)

# Add paths to look for executables.
export PATH=$PATH:${HOME}/go/bin
export PATH=$PATH:${HOME}/go/src/github.com/giantswarm/architect
export PATH=$PATH:${HOME}/go/src/github.com/giantswarm/gsctl
export PATH=$PATH:${HOME}/go/src/github.com/giantswarm/opsctl

export PATH=$PATH:${HOME}/go/src/github.com/xh3b4sd/laika

export PATH=$PATH:/usr/local/opt/curl/bin
export PATH=$PATH:/usr/local/kubebuilder/bin



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
plugins=(git vi-mode history-substring-search kubectl kube-ps1 gsctl opsctl)



source $ZSH/oh-my-zsh.sh

# Disable all highltighters of the zsh-syntax-highlighting plugin. The plugin is
# required due to some bug in history-substring-search.
ZSH_HIGHLIGHT_HIGHLIGHTERS=()

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

# kube-ps1 settings.
KUBE_PS1_COLOR_CONTEXT="%{$fg[red]%}"
KUBE_PS1_COLOR_SYMBOL="%{$fg[red]%}"
KUBE_PS1_DIVIDER=
KUBE_PS1_NS_ENABLE="false"
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
RPS1=$RPS1' $(kube_ps1)'



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
alias gpl='git pull --no-edit'
alias gps='git push'

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



# Golang compilation arguments.
export GOPATH=~/go
export PATH=${PATH}:${GOPATH}/bin
export GOARCH=$(go env GOARCH)
export GOOS=$(go env GOOS)

[[ -s "/Users/xh3b4sd/.gvm/scripts/gvm" ]] && source "/Users/xh3b4sd/.gvm/scripts/gvm"
