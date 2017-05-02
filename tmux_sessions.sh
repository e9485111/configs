#!/bin/bash
tmux new-session -d -s "cwy"

tmux new-session -d -s "ha-redis" -n "ha-redis01" "ssh ha-redis01"
tmux new-window -t "ha-redis:1" -n "ha-redis02"  "ssh ha-redis02"

for i in cwy-dev buck01 buck02 buck03 buck04 buck05 buck06 buck07 buck08 \
  buck09 buck10 ash01 ash02 ash03 ash04 ash05 ash06 dev03 mesa01 build \
unstable dashboard find-zone find-graphite find-dashboard1 find-log \
deploy
do
tmux new-session -d -s "$i" "ssh $i"
tmux new-window -t "$i:1" "ssh $i"
tmux new-window -t "$i:2" "ssh $i"
tmux new-window -t "$i:3" "ssh $i"
done

tmux new-session -d -s "kube" -n "kube1" "ssh find-kube01"
tmux new-window -t "kube:1" -n "kube2" "ssh find-kube02"
tmux new-window -t "kube:2" -n "kube3" "ssh find-kube03"
#tmux new-window -t "kube:3" -n "all" "~/split.sh find-kube0 1 2 3"
tmux new-window -t "kube:3" -n "all"
tmux send-key -t "kube:3"  "~/split.sh find-kube0 1 2 3" ENTER

tmux new-session -d -s "gilbert" -n "g1" "ssh g1"
tmux new-window -t "gilbert:1" -n "g2" "ssh g2"
tmux new-window -t "gilbert:2" -n "g4" "ssh g4"
tmux new-window -t "gilbert:3" -n "g5" "ssh g5"

for i in 4 5
do
  exists=`tmux list-windows -t gilbert|grep $i:\ all`
  if [[ -z "$exists" ]];
  then
    tmux new-window -t "gilbert:$i" -n "all"
    tmux splitw -t "gilbert:$i"  -v -p 50
    tmux splitw -t "gilbert:$i.1"  -h -p 50
    tmux send-key -t "gilbert:$i.0" "ssh g1" ENTER
    tmux send-key -t "gilbert:$i.1" "ssh g2" ENTER
    tmux send-key -t "gilbert:$i.2" "ssh g4" ENTER

  fi
done
tmux new-session -d -s "cassandra" -n "cassandra1" "ssh cassandra1"
tmux new-window -t "cassandra:1" -n "cassandra2" "ssh cassandra2"
tmux new-window -t "cassandra:2" -n "cassandra3" "ssh cassandra3"
tmux new-window -t "cassandra:3" -n "cassandra4" "ssh cassandra4"
tmux new-window -t "cassandra:4" -n "cassandra5" "ssh cassandra5"
tmux new-window -t "cassandra:5" -n "cassandra6" "ssh cassandra6"

tmux new-window -t "cassandra:7" -n "all"
tmux send-key -t "cassandra:7"  "~/split.sh cassandra 1 2 3 4 5 6" ENTER

tmux new-session -d -s "cassandra2" -n "cassandra7" "ssh cassandra7"
tmux new-window -t "cassandra2:1" -n "cassandra8" "ssh cassandra8"
tmux new-window -t "cassandra2:2" -n "cassandra9" "ssh cassandra9"
tmux new-window -t "cassandra2:3" -n "cassandra10" "ssh cassandra10"
tmux new-window -t "cassandra2:4" -n "cassandra11" "ssh cassandra11"
tmux new-window -t "cassandra2:5" -n "cassandra12" "ssh cassandra12"

tmux new-window -t "cassandra2:7" -n "all"
tmux send-key -t "cassandra2:7"  "~/split.sh cassandra 7 8 9 10 11 12" ENTER


#exists=`tmux list-windows -t cassandra2|grep 8:\ all`
#if [[ -z "$exists" ]];
#then
#  tmux new-window -t "cassandra2:8" -n "all"
#  tmux splitw -t "cassandra2:8"  -h -p 33
#  tmux splitw -t "cassandra2:8.0" -h -p 50
#  tmux splitw -t "cassandra2:8.0" -v -p 50
#  tmux splitw -t "cassandra2:8.2" -v -p 50
#  tmux splitw -t "cassandra2:8.4" -v -p 50
#  tmux send-key -t "cassandra2:8.0" "ssh cassandra7" ENTER
#  tmux send-key -t "cassandra2:8.1" "ssh cassandra10" ENTER
#  tmux send-key -t "cassandra2:8.2" "ssh cassandra8" ENTER
#  tmux send-key -t "cassandra2:8.3" "ssh cassandra11" ENTER
#  tmux send-key -t "cassandra2:8.4" "ssh cassandra9" ENTER
#  tmux send-key -t "cassandra2:8.5" "ssh cassandra12" ENTER
#fi

tmux new-session -d -s "crdb" -n "crdb1" "ssh crdb1"
tmux new-window -t "crdb:1" -n "crdb2" "ssh crdb2"
tmux new-window -t "crdb:2" -n "crdb3" "ssh crdb3"

tmux new-window -t "crdb:7" -n "all"
tmux send-key -t "crdb:7"  "~/split.sh crdb 1 2 3" ENTER

tmux attach-session -t "cwy"
