#!/bin/bash
tmux new-session -d -s "cwy"

tmux new-session -d -s "ha-redis" -n "ha-redis01" "ssh ha-redis01"
tmux new-window -t "ha-redis:1" -n "ha-redis02"  "ssh ha-redis02"

tmux new-session -d -s "ardb" -n "ardb0" "ssh ardb0"
tmux new-window -t "ardb:1" -n "ardb1" "ssh ardb1"


tmux new-session -d -s "ardb-test" -n "ardb-test0" "ssh ardb-test"

tmux new-session -d -s "ardbrec" -n "ardbrec0" "ssh ardbrec0"
tmux new-window -t "ardbrec:1" -n "ardbrec1" "ssh ardbrec1"
tmux new-window -t "ardbrec:2" -n "ardbrec2" "ssh ardbrec2"
tmux new-window -t "ardbrec:3" -n "ardbrec3" "ssh ardbrec3"
tmux new-window -t "ardbrec:4" -n "ardbrec4" "ssh ardbrec4"

for i in buck01 buck02 buck03 buck04 buck05 buck06 buck07 buck08 buck09 buck10 ash01 ash02 ash03 ash04 ash05 ash06 dev03 mesa01 build unstable
do
tmux new-session -d -s "$i" "ssh $i"
tmux new-window -t "$i:1" "ssh $i"
tmux new-window -t "$i:2" "ssh $i"
tmux new-window -t "$i:3" "ssh $i"
done

tmux new-session -d -s "dev03" "ssh dev03"
tmux new-window -t "dev03:1" "ssh dev03"
tmux new-window -t "dev03:2" "ssh dev03"

tmux new-session -d -s "cassandra" -n "cassandra1" "ssh cassandra1"
tmux new-window -t "cassandra:1" -n "cassandra2" "ssh cassandra2"
tmux new-window -t "cassandra:2" -n "cassandra3" "ssh cassandra3"
tmux new-window -t "cassandra:3" -n "cassandra4" "ssh cassandra4"
tmux new-window -t "cassandra:4" -n "cassandra5" "ssh cassandra5"
tmux new-window -t "cassandra:5" -n "cassandra6" "ssh cassandra6"
exists=`tmux list-windows -t cassandra|grep 8:\ all`
if [[ -z "$exists" ]];
then
  tmux new-window -t "cassandra:8" -n "all"
  tmux splitw -t "cassandra:8"  -h -p 33
  tmux splitw -t "cassandra:8.0" -h -p 50
  tmux splitw -t "cassandra:8.0" -v -p 50
  tmux splitw -t "cassandra:8.2" -v -p 50
  tmux splitw -t "cassandra:8.4" -v -p 50
  tmux send-key -t "cassandra:8.0" "ssh cassandra1" ENTER
  tmux send-key -t "cassandra:8.1" "ssh cassandra4" ENTER
  tmux send-key -t "cassandra:8.2" "ssh cassandra2" ENTER
  tmux send-key -t "cassandra:8.3" "ssh cassandra5" ENTER
  tmux send-key -t "cassandra:8.4" "ssh cassandra3" ENTER
  tmux send-key -t "cassandra:8.5" "ssh cassandra6" ENTER
  fi
tmux attach-session -t "cwy"
