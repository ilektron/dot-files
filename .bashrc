# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

alias gco="git checkout"
alias gst="git status"
alias gb="git branch"
alias gpl="git pull"
alias gplr="git pull --rebase"
alias gps="git push"
alias gcom="git commit"
alias dbdev='ssh -L 8081:localhost:8080 modifyinkdev'
alias dblive='ssh -L 8081:localhost:8080 modifyinkdb'
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
PS1="\[$Cyan\]\w\[$Yellow\]\$(__git_ps1 ' (%s)') \[$White\]-> "
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Change limit of number open files allowed
ulimit -n 4096

export NVM_DIR="/Users/isaachess/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

##################
## Vivint stuff ##
##################

alias activate="source ~/Programming/vivint/Platform/MY_ENV/bin/activate" # Enter the virtual environment
alias start_services="launchctl load ~/Library/LaunchAgents/Vivint/*" # start rabbitmq, nginx, memcached, redis
alias stop_services="launchctl unload ~/Library/LaunchAgents/Vivint/*" # stop the above
alias bemuse="nohup ~/Programming/vivint/bemuse/BemuseDev/bemusedev.sh &" # start bemuse