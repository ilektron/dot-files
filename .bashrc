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
export CONSTANTS_HOME="/Users/isaachess/Programming/vivint/Constants"
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
alias bemuse="nohup ~/Programming/vivint/bemuse/BemuseDev/bemusedev.sh > ~/Programming/vivint/bemuse.log &" # start bemuse
alias mango="mongo -u admin -p mangotango --authenticationDatabase admin" # run mongo with appropriate vivint user info
alias Platform="cd ~/Programming/vivint/Platform"
alias CustomerWebApp="cd ~/Programming/vivint/CustomerWebApp"
alias AdminWebApp="cd ~/Programming/vivint/AdminWebApp"
alias Salt="cd ~/Programming/vivint/Platform-salt"
alias Constants="cd ~/Programming/vivint/Constants"
alias DataListener="cd ~/Programming/vivint/DataListener"

# set vivint platform ip
function get_my_ip() {
    echo $(ifconfig -a |egrep -o 'inet 10(\.[0-9]+){3}' |egrep -o '10(\.[0-9]+){3}')
}
function get_panel_ip() {
    echo $(sudo arp-scan -I en7 --localnet |grep 00:25:f0:a8:ae:21 |cut -f 1)
}
function set_panel_cloud_address() {
    PANEL_IP=$(get_panel_ip)
    MY_IP=$(get_my_ip)
    curl -v -X POST --data "primary=$MY_IP&secondary=$MY_IP" -H 'Content-Type: application/x-www-form-urlencoded'  http://{$PANEL_IP}:8090/settings/set_cloud_address
}

function vivint_mongo_start() {
    # Make sure mongo is running
    sudo mkdir -p /var/lib/mongo/config
    sudo mkdir -p /var/lib/mongo/data0-0
    sudo mkdir -p /var/lib/mongo/data0-1
    sudo mkdir -p /var/lib/mongo/arb0
    sudo mkdir -p /var/lib/mongo/data1-0
    sudo mkdir -p /var/lib/mongo/data0-2
    sudo mkdir -p /var/lib/mongo/arb1
    sudo mkdir -p /var/log/mongo
    sudo mkdir -p /var/run/mongodb
    sudo mkdir -p /var/run/mongo
    sudo mkdir -p /var/run/platform
    sudo mkdir -p /data/db
    sudo mkdir /var/log/platform
    sudo chown isaachess /var/log/platform
    sudo mkdir /etc/platform
    sudo chown isaachess /etc/platform
    sudo mongod -f /usr/local/etc/mongoc.conf
    sudo mongod -f /usr/local/etc/mongod0-0.conf
    sudo mongod -f /usr/local/etc/mongod0-1.conf
    sudo mongod -f /usr/local/etc/mongod0-2.conf
    sudo mongod -f /usr/local/etc/mongod1-0.conf
    sudo mongod -f /usr/local/etc/mongod1-1.conf
    sudo mongod -f /usr/local/etc/mongod1-2.conf
    sudo mongos -f /usr/local/etc/mongos.conf
}

function vivint_mongo_stop() {
    sudo pkill mongo
}

function vivint_pingfederate() {
    /bin/bash ~/Programming/vivint/pingfederate/pingfederate-7.3.0/pingfederate/bin/run.sh
}

function vivint_start() {
    # start services
    start_services
    # start mongo
    vivint_mongo_start
    # start ping federate
    vivint_pingfederate
}
