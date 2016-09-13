#!/bin/bash
tmux new-session -d -s "cwy"

tmux new-session -d -s "ha-redis" -n "ha-redis01" "ssh ha-redis01"
tmux new-window -t "ha-redis:1" -n "ha-redis02"  "ssh ha-redis02"

tmux new-session -d -s "ardb" -n "ardb0" "ssh ardb0"
tmux new-window -t "ardb:1" -n "ardb1" "ssh ardb1"

tmux new-session -d -s "ardbrec" -n "ardb0" "ssh ardbrec0"
tmux new-window -t "ardbrec:1" -n "ardb1" "ssh ardbrec1"

tmux new-session -d -s "buck07" "ssh buck07"
tmux new-window -t "buck07:1" "ssh buck07"
tmux new-window -t "buck07:2" "ssh buck07"
tmux new-window -t "buck07:3" "ssh buck07"

tmux new-session -d -s "buck02" "ssh buck02"
tmux new-window -t "buck02:1" "ssh buck02"
tmux new-window -t "buck02:2" "ssh buck02"

tmux new-session -d -s "buck04" "ssh buck04"
tmux new-window -t "buck04:1" "ssh buck04"
tmux new-window -t "buck04:2" "ssh buck04"

tmux new-session -d -s "mesa02" "ssh mesa02"
tmux new-window -t "mea02:1" "ssh mesa02"
tmux new-window -t "mea02:2" "ssh mesa02"

tmux attach-session -t "cwy"
