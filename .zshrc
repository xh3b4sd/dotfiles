# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="zyndiecate"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
precmd() { echo -ne "\e]1;$(basename $(echo $PWD))\a" }

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode jsontools vagrant)

# User configuration

export PATH="/home/vagrant/.nvm/v0.10.24/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
if [ "$(uname)" = "Darwin" ]; then
  alias l='ls -lhG'
  alias ll='ls -lahG'
else
  alias l='ls -lh --group-directories-first --color'
  alias ll='ls -lah --group-directories-first --color'
fi

alias rt=renametab
alias memory='sudo lshw -C memory'
alias httpdump='sudo tcpdump -i eth0 -n -s 0 -w - | grep --color=never-a -o -E "Host\: .*|GET \/.*"'
alias curl_timing='curl -w "\n\n%{http_code} -> TOTAL: %{time_total}, DNS Lookup: %{time_namelookup}, Connect: %{time_connect}, Start Transfer: %{time_starttransfer}\n\n"'
alias rmmerged='git branch --merged master | grep -v "master$" | xargs git branch -d'
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gs='git status'
alias gcm='git commit'
alias gps='git push'
alias gpl='git pull'
alias gfc='git log $(git log --pretty=format:%H|tail -1)' # show first commit

alias netstatosx='lsof -n -i4TCP | grep LISTEN'
alias riakosx='ulimit -S -n 4096 && riak start'
alias jsonprint='pbpaste | jsonpp | coderay -json'
alias randomhash='openssl rand -base64 32'

alias registry='fleetctl --strict-host-key-checking=false --tunnel registry.fleet.giantswarm.io'
alias cluster01='fleetctl --strict-host-key-checking=false --tunnel cluster-01.fleet.giantswarm.io'
alias clusterapi='fleetctl --strict-host-key-checking=false --tunnel api.fleet.giantswarm.io'
alias clusteralpha='fleetctl --strict-host-key-checking=false --tunnel alpha.fleet.giantswarm.io'
alias listservercertificates='aws iam list-server-certificates'
alias cli01='~/projects/giantswarm/cli/swarm --api-endpoint="https://cluster-01.giantswarm.io/v1/"'
alias updatedocker='curl -s https://get.docker.io/ubuntu/ | sudo sh'
