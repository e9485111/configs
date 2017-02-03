# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias grep='grep --color'
alias less='less -MSr'
alias lh='ls -lh'
alias lg='ll|grep'
alias la='ll -a'
alias lah='ll -ah'
alias cl='clear'
alias ka='killall'
alias j='z'
alias jj='zz'
alias se='sf -e vim'
alias pg='ps aux |grep'
alias hg='hi|grep'
alias vi='vim'
alias hi='history'
alias du1='du -h --max-depth=1'

tg() { tail -f $1|grep -P "$2"; }

SSH_ENV=$HOME/.ssh/environment
PATH=/usr/local/bin:/usr/lib/scala/bin:$PATH

alias gst='git st'
alias gdf='git diff'

export VISUAL=vim

eval "$(fasd --init auto)"

export PATH="/home/cyen/.pyenv/bin:$PATH"
pyenv=`which pyenv 2>/dev/null`
if [ "$pyenv" ];
then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export JAVA_HOME=/opt/jdk1.8.0_101

jstart() {
   for i in $@; do
       echo "start jetty "$i
       sudo service jetty$i start
       echo
   done
}

jout() {
   for i in $@; do
       echo "take out "$i
       curl localhost:$1/v3/takeoutofrotation
       echo
   done
}

jstop() {
   for i in $@; do
       echo "stop jetty "$i
       sudo service jetty$i stop
       echo
   done
}

jstart() {
   for i in $@; do
       echo "start jetty "$i
       sudo service jetty$i start
       echo
   done
}

enterfolder() {
   cd /var/jetty$1/DomainIQ/logs
   pwd
}

jin() {
   for i in $@; do
       echo "put in "$i
       curl localhost:$i/v3/putbackintorotation
       echo
   done
}
