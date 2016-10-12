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

tmux new-session -d -s "buck05" "ssh buck05"
tmux new-window -t "buck05:1" "ssh buck05"
tmux new-window -t "buck05:2" "ssh buck05"

tmux new-session -d -s "buck08" "ssh buck08"
tmux new-window -t "buck08:1" "ssh buck08"
tmux new-window -t "buck08:2" "ssh buck08"

tmux new-session -d -s "mesa02" "ssh mesa02"
tmux new-window -t "mea02:1" "ssh mesa02"
tmux new-window -t "mea02:2" "ssh mesa02"

tmux new-session -d -s "dev03" "ssh dev03"
tmux new-window -t "dev03:1" "ssh dev03"
tmux new-window -t "dev01:2" "ssh dev03"

tmux new-session -d -s "cassandra" -n "cassandra1" "ssh cassandra1"
tmux new-window -t "cassandra:1" -n "cassandra2" "ssh cassandra2"
tmux new-window -t "cassandra:2" -n "cassandra3" "ssh cassandra3"
tmux new-window -t "cassandra:3" -n "cassandra4" "ssh cassandra4"
tmux new-window -t "cassandra:4" -n "cassandra5" "ssh cassandra5"
tmux new-window -t "cassandra:5" -n "cassandra6" "ssh cassandra6"

tmux new-session -d -s "ash02" "ssh ash02"
tmux new-window -t "ash02:1" "ssh ash02"
tmux new-window -t "ash-2:2" "ssh ash02"
tmux attach-session -t "cwy"
