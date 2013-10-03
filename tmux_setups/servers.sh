#!/bin/bash

tmux new-session -s servers -d "ssh <some server>"
tmux split-window -v "ssh <some server>"
tmux attach -t servers
