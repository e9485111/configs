#!/bin/bash
list=$1
max=`tmux list-window|tail -n -1|grep -oP "^\d+"`
#next=$((max+1))
next=$((max))
count=0
size=$#
total_pane=$((size-1))
#tmux new-window
if [ $total_pane -eq 3 ];
then
  tmux splitw -t "$next"  -v -p 50
  tmux splitw -t "$next.1"  -h -p 50
  tmux send-key -t "$next.0" "ssh $1$2" ENTER
  tmux send-key -t "$next.1" "ssh $1$3" ENTER
  tmux send-key -t "$next.2" "ssh $1$4" ENTER
fi
if [ $total_pane -eq 4 ];
then
  tmux splitw -t "$next"  -v -p 50
  tmux splitw -t "$next.1"  -h -p 50
  tmux splitw -t "$next.0"  -h -p 50
  tmux send-key -t "$next.0" "ssh $1$2" ENTER
  tmux send-key -t "$next.1" "ssh $1$3" ENTER
  tmux send-key -t "$next.2" "ssh $1$4" ENTER
  tmux send-key -t "$next.3" "ssh $1$5" ENTER
fi
if [ $total_pane -eq 5 ];
then
  tmux splitw -t "$next"  -v -p 50
  tmux splitw -t "$next.0"  -h -p 33
  tmux splitw -t "$next.2"  -h -p 33
  tmux splitw -t "$next.2"  -h -p 50
  tmux send-key -t "$next.0" "ssh $1$2" ENTER
  tmux send-key -t "$next.1" "ssh $1$3" ENTER
  tmux send-key -t "$next.2" "ssh $1$4" ENTER
  tmux send-key -t "$next.3" "ssh $1$5" ENTER
  tmux send-key -t "$next.4" "ssh $1$6" ENTER
fi

if [ $total_pane -eq 6 ];
then
  tmux splitw -t "$next"  -h -p 50
  tmux splitw -t "$next.0"  -v -p 25
  tmux splitw -t "$next.2"  -v -p 50
  tmux splitw -t "$next.2"  -v -p 50
  tmux splitw -t "$next.4"  -v -p 50
  tmux send-key -t "$next.0" "ssh $1$2" ENTER
  tmux send-key -t "$next.1" "ssh $1$3" ENTER
  tmux send-key -t "$next.2" "ssh $1$4" ENTER
  tmux send-key -t "$next.3" "ssh $1$5" ENTER
  tmux send-key -t "$next.4" "ssh $1$6" ENTER
  tmux send-key -t "$next.4" "ssh $1$7" ENTER
fi
if [ $total_pane -eq 7 ];
then
  tmux splitw -t "$next"  -h -p 50
  tmux splitw -t "$next.0"  -v -p 50
  tmux splitw -t "$next.1"  -v -p 50
  tmux splitw -t "$next.3"  -v -p 50
  tmux splitw -t "$next.3"  -v -p 50
  tmux splitw -t "$next.5"  -v -p 50
  tmux send-key -t "$next.0" "ssh $1$2" ENTER
  tmux send-key -t "$next.1" "ssh $1$3" ENTER
  tmux send-key -t "$next.2" "ssh $1$4" ENTER
  tmux send-key -t "$next.3" "ssh $1$5" ENTER
  tmux send-key -t "$next.4" "ssh $1$6" ENTER
  tmux send-key -t "$next.5" "ssh $1$7" ENTER
  tmux send-key -t "$next.6" "ssh $1$8" ENTER
fi
