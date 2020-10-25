export LANG="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Preferred editor for local sessions.
export VISUAL="code -w"
export EDITOR="code -w"

# Do not get annoyed by homebrew Github API magic.
export HOMEBREW_NO_GITHUB_API=true

# Do not edit git merge messages in editors.
export GIT_MERGE_AUTOEDIT=no



# The profile used by the aws CLI can be overwritten like below. Alternatively
# aws CLI commands take the --profile flag if that is an option for the use
# case.
#
#     export AWS_PROFILE=<profile>
#
export AWS_DEFAULT_PROFILE="venturemark"
export AWS_DEFAULT_REGION="eu-central-1"



# azure
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
export OPSCTL_SLACK_TOKEN=$(cat ~/.credential/opsctl-slack-token)

# github-exporter
export GITHUB_EXPORTER_GITHUB_TOKEN=$(cat ~/.credential/github-exporter-github-token)

# github-tweeter
export GITHUB_TWEETER_GITHUB_TOKEN=$(cat ~/.credential/github-tweeter-github-token)

# red
export RED_GPG_PASS=$(cat ~/.credential/red-gpg-pass)

# twitter
export TWITTER_CONSUMER_KEY=$(cat ~/.credential/twitter-consumer-key)
export TWITTER_CONSUMER_SECRET=$(cat ~/.credential/twitter-consumer-secret)
export TWITTER_ACCESS_TOKEN=$(cat ~/.credential/twitter-access-token)
export TWITTER_ACCESS_SECRET=$(cat ~/.credential/twitter-access-secret)



# Add paths to look for executables.
export PATH=$PATH:${HOME}/go/bin

export PATH=$PATH:${HOME}/go/src/github.com/giantswarm/awscnfm
export PATH=$PATH:${HOME}/go/src/github.com/giantswarm/devctl
export PATH=$PATH:${HOME}/go/src/github.com/giantswarm/gg
export PATH=$PATH:${HOME}/go/src/github.com/giantswarm/gsctl
export PATH=$PATH:${HOME}/go/src/github.com/giantswarm/opsctl

export PATH=$PATH:${HOME}/go/src/github.com/xh3b4sd/kia
export PATH=$PATH:${HOME}/go/src/github.com/xh3b4sd/pag
export PATH=$PATH:${HOME}/go/src/github.com/xh3b4sd/red
export PATH=$PATH:${HOME}/go/src/github.com/xh3b4sd/workflow

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

# Do not remove whitespace before pipe. Without this setting "command |" becomes
# "command|" on tab completion.
ZLE_SPACE_SUFFIX_CHARS=$'|&'



DISABLE_MAGIC_FUNCTIONS="true"



# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws
  awscnfm
  git
  history-substring-search
  kind
  kubectl
  kube-ps1
  devctl
  eksctl
  gsctl
  istioctl
  kia
  opsctl
  pag
  red
  vi-mode
  vi-increment
  workflow
)



source $ZSH/oh-my-zsh.sh



# Disable all highltighters of the zsh-syntax-highlighting plugin. The plugin is
# required due to some bug in history-substring-search.
ZSH_HIGHLIGHT_HIGHLIGHTERS=()


export HISTSIZE=10000
export SAVEHIST=10000

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

setopt INC_APPEND_HISTORY_TIME

# bind k and j for VI mode history substring seach
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red'
export HISTORY_SUBSTRING_SEARCH_FUZZY="true"
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE="true"



# Complete commands on first <TAB> even if suggestions are ambigious.
setopt MENU_COMPLETE



# Clear right prompt after each command. This prevents copying the command
# indicator (<<<) when copying terminal output.
setopt TRANSIENTRPROMPT

# Prevent "zsh: file exists: <file>" warnings when redirecting using >.
setopt CLOBBER

# Show command indicator (<<<) immediatelly (0.1s) after activating it (hitting
# ESC).
export KEYTIMEOUT=1



# kube-ps1 settings.
KUBE_PS1_CTX_COLOR="green"
KUBE_PS1_DIVIDER=""
KUBE_PS1_NS_ENABLE="false"
KUBE_PS1_PREFIX=""
KUBE_PS1_SEPARATOR=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_SYMBOL_ENABLE="false"
KUBE_PS1_SYMBOL_USE_IMG="false"
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
alias gf='FINISHED_BRANCH=$(git rev-parse --abbrev-ref HEAD); git checkout master &> /dev/null || git checkout main &> /dev/null; git pull --no-edit; git fetch -p; git branch -D $FINISHED_BRANCH' # finish and cleanup feature branch
alias gr='git revert --no-edit'
alias gs='git status'
alias gcm='git commit'
alias gfc='git log $(git log --pretty=format:%H|tail -1)' # show first commit
alias gpl='git pull --no-edit'
alias gps='git push'

unalias gg

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



# Active gvm, a golang version manager.
[[ -s "/Users/xh3b4sd/.gvm/scripts/gvm" ]] && source "/Users/xh3b4sd/.gvm/scripts/gvm"



# Golang compilation arguments.
export GOPATH=~/go
export PATH=${PATH}:${GOPATH}/bin
export GO111MODULE="on"
export GOARCH=$(go env GOARCH)
export GOOS=$(go env GOOS)
