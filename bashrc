# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias grep='grep --color'
alias less='less -MSr'
alias ls='ls -G'
alias ll='ls -l'
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
alias kpf="kubectl port-forward"
alias kuc="kubectl config use-context"
alias kgc="kubectl config get-contexts"
alias kg="kubectl get"
alias kc="kubectl create"
alias kdel="kubectl delete"
alias ke="kubectl exec -it"
alias kl="kubectl logs"
alias kgg="kubectl get pod|grep "
alias kggs="kubectl get svc|grep "

tg() { tail -f $1|grep -P "$2"; }

SSH_ENV=$HOME/.ssh/environment
PATH=/usr/local/bin:/usr/lib/scala/bin:$PATH

alias gst='git st'
alias gdf='git diff'

export VISUAL=vim
export GOPATH=/home/cyen/go

export PATH="/home/cyen/.pyenv/bin:$HOME/bin:$PATH"

export PATH="/home/cyen/.pyenv/bin:$PATH"

pyenv=`which pyenv 2>/dev/null`
if [ "$pyenv" ];
then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

NORMAL="\[\033[00m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[33m\]"
LIGHTGREEN="\[\e[1;32m\]"
GREEN="\[\033[32m\]"

export PS1="\u@g\h ${GREEN}\w${YELLOW}\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')${BLUE}\$(k config get-contexts 2>/dev/null|grep \\*|awk '{print \"(\" \$2 \")\"}')${NORMAL} $ "
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cyen/google-cloud-sdk/path.bash.inc' ]; then source '/home/cyen/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/home/cyen/google-cloud-sdk/completion.bash.inc' ]; then source '/home/cyen/google-cloud-sdk/completion.bash.inc'; fi
