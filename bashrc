# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias grep='grep --color'
alias less='less -M'
alias lh='ll -h'
alias cl='clear'
alias hi='history'
alias lh='ll -h'
alias du1='du -h --max-depth=1'
alias hive='hive --hiveconf hive.cli.print.current.db=true --hiveconf hive.auto.convert.join=true --hiveconf hive.mapjoin.smalltable.filesize=200000000'
SSH_ENV=$HOME/.ssh/environment
export PYSPARK_DRIVER_PYTHON=/usr/bin/python
PATH=/usr/local/bin:$PATH:/data1/home/cyen/git/targeting/app/node_modules/.bin
. /usr/share/doc/git-1.8.3.1/contrib/completion/git-completion.bash


alias gst='git st'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
PATH=/usr/local/bin:$PATH
export VISUAL=vim
