#!/bin/bash
tmux new-session -d -s "gcwy"

for i in gcwy logging jenkins
do
tmux new-session -d -s "$i" "ssh $i"
tmux new-window -t "$i:1" "ssh $i"
tmux new-window -t "$i:2" "ssh $i"
tmux new-window -t "$i:3" "ssh $i"
done

tmux new-session -d -s "consul" -n "consul1" "ssh consul1"
tmux new-window -t "consul:1" -n "consul2" "ssh consul2"
tmux new-window -t "consul:2" -n "consul3" "ssh consul3"
tmux new-window -t "consul:3" -n "consul4" "ssh consul4"
tmux new-window -t "consul:4" -n "all"
tmux send-key -t "consul:4"  "~/split.sh consul 1 2 3 4" ENTER


tmux attach-session -t "gcwy"
