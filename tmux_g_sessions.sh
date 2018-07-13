#!/bin/bash
tmux new-session -d -s "gcwy"

for i in logging jenkins vpn-server logging-asia logging-europe haproxy-cert graphite logging-useast-jenkins es jenkins-asia gcp-logging-useast domains-dashboard elk
do
tmux new-session -d -s "$i" "ssh $i"
tmux new-window -t "$i:1" "ssh $i"
tmux new-window -t "$i:2" "ssh $i"
tmux new-window -t "$i:3" "ssh $i"
done

tmux attach-session -t "gcwy"
