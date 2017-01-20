# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias grep='grep --color'
alias less='less -MSr'
alias lh='ls -lh'
alias cl='clear'
alias ka='killall'
alias j='z'
alias jj='zz'
alias se='sf -e vim'
alias pg='ps aux |grep'
alias hig='hi|grep'
alias vi='vim'
alias hi='history'
alias du1='du -h --max-depth=1'
alias hive='hive --hiveconf hive.cli.print.current.db=true --hiveconf hive.auto.convert.join=true --hiveconf hive.mapjoin.smalltable.filesize=200000000'

tg() { tail -f $1|grep -P "$2"; }

SSH_ENV=$HOME/.ssh/environment
PATH=/usr/local/bin:/usr/lib/scala/bin:$PATH

alias gst='git st'
alias gdf='git diff'
alias gda='git diff'

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/cyen/.sdkman"
[[ -s "/home/cyen/.sdkman/bin/sdkman-init.sh" ]] && source "/home/cyen/.sdkman/bin/sdkman-init.sh"

export JAVA_HOME=/opt/jdk1.8.0_101
