# search and replace in a directoy
# find . -name "*.jade" -print0 | xargs -0 sed -i '' -e 's/columns/column/g'

# enable 256 color terminal
export TERM=xterm-256color



# fix locale foo
unset LC_ALL



# init nvm
[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh



# init rvm
[ -f ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm



# init git bash completion
[ "$(uname)" == "Darwin" ] && [ -d "/usr/local/opt/git/etc/bash_completion.d/" ] && source /usr/local/opt/git/etc/bash_completion.d/*
[ "$(uname)" == "Linux" ] && [ -d "/usr/local/opt/git/etc/bash_completion.d/" ] && source /etc/bash_completion.d/git



# git branch in prompt
function git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# current directory in tab title
PROMPT_COMMAND='echo -ne "\033]0;$(basename $(echo $PWD))\007"'
# colorized prompt
export PS1='\[\033[0;32m\]\u@\h\[\033[0;31m\]$(git_branch)\[\033[00m\] \$ '


# aliases
function renametab () {
  echo -en "\033];$1\007"
}

if [ "$(uname)" == "Darwin" ]; then
  alias l='ls -lhG'
  alias ll='ls -lahG'
else
  alias l='ls -lh --group-directories-first --color'
  alias ll='ls -lah --group-directories-first --color'
fi

alias rt=renametab
alias be='bundle exec'
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
alias cluster02='fleetctl --strict-host-key-checking=false --tunnel cluster02.fleet.giantswarm.io'
alias cluster03='fleetctl --strict-host-key-checking=false --tunnel cluster03.fleet.giantswarm.io'
alias cluster04='fleetctl --strict-host-key-checking=false --tunnel cluster04.fleet.giantswarm.io'
alias clusteralpha='fleetctl --strict-host-key-checking=false --tunnel alpha.fleet.giantswarm.io'
alias listservercertificates='aws iam list-server-certificates'
alias cli01='~/projects/giantswarm/cli/swarm --api-endpoint="https://cluster-01.giantswarm.io/v1/"'
alias cli02='~/projects/giantswarm/cli/swarm --api-endpoint="http://cluster02.giantswarm.io/v1/"'
alias cli03='~/projects/giantswarm/cli/swarm --api-endpoint="http://cluster03.giantswarm.io/v1/"'
alias cli04='~/projects/giantswarm/cli/swarm --api-endpoint="http://cluster04.giantswarm.io/v1/"'
alias clialpha='~/projects/giantswarm/cli/swarm --api-endpoint="http://alpha.giantswarm.io/v1/"'
alias updatedocker='curl -s https://get.docker.io/ubuntu/ | sudo sh'
