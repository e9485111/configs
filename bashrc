# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias grep='grep --color'
alias less='less -MS'
alias ls='ls -G'
alias ll='ls -lG'
alias lh='ls -lGh'
alias cl='clear'
alias j='z'
alias vi='vim'
alias hi='history'
alias du1='du -h --max-depth=1'
alias hive='hive --hiveconf hive.cli.print.current.db=true --hiveconf hive.auto.convert.join=true --hiveconf hive.mapjoin.smalltable.filesize=200000000'
SSH_ENV=$HOME/.ssh/environment
export PYSPARK_DRIVER_PYTHON=/usr/bin/python
#export PYSPARK_DRIVER_PYTHON=/usr/local/bin/python
PATH=/usr/local/bin:$PATH:/data1/home/cyen/git/targeting/app/node_modules/.bin
#. /usr/share/doc/git-1.8.3.1/contrib/completion/git-completion.bash


alias gst='git st'
alias gdf='git diff'
alias gda='git diff'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
PATH=/usr/local/bin:$PATH
export VISUAL=vim

eval "$(fasd --init auto)"

#export PATH="/home/cyen/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
source ~/.iterm2_shell_integration.`basename $SHELL`
