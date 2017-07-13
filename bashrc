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
alias k='kubectl'
alias jj='zz'
alias se='sf -e vim'
alias pg='ps aux |grep'
alias hg='hi|grep'
alias tf='tail -f'
alias vi='vim'
alias hi='history'
alias du1='du -h --max-depth=1'
alias d='docker'
alias k="kubectl"
alias kd="kubectl describe"
alias kg="kubectl get"
alias kc="kubectl create"
alias kdel="kubectl delete"
alias ke="kubectl exec -it"
alias kdes="kubectl describe"
alias kl="kubectl logs"
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

export PS1="\u@\h ${GREEN}\w${YELLOW}\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')${BLUE}\$(k config get-contexts 2>/dev/null|grep \\*|awk '{print \"(\" \$2 \")\"}')${NORMAL} $ "
export JAVA_HOME=/opt/jdk1.8.0_101

jport() {
  ps aux|grep jetty|grep -oP "(?<=jetty)\d\d\d\d"|sort|uniq
}
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
       curl localhost:$i/v3/takeoutofrotation
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
