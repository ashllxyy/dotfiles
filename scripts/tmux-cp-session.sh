#!/bin/bash

# Name of the tmux session
SESSION="cp"
# Path to CP folder
CP_DIR="$HOME/competitive_programming"
# Choose text editor (e.g., nvim, vim, nano, micro, code)
DEFAULT_EDITOR="nvim"

# 1. Start a new session named 'cp' in the background (-d)
tmux new-session -d -s $SESSION -c "$CP_DIR"

# 2. Split the window vertically to create the right column
tmux split-window -h -c "$CP_DIR"

# 3. Split right pane horizontally to create the top and bottom rows
tmux split-window -v -c "$CP_DIR"

# 4. Open chosen editor in the main Left Pane (Pane 0)
tmux send-keys -t $SESSION:0.0 "$DEFAULT_EDITOR code.cpp" C-m

# 5. Open input and output files in the right panes using the same editor
# Pane 1 is Top-Right (Input)
tmux send-keys -t $SESSION:0.1 "$DEFAULT_EDITOR input.txt" C-m

# Pane 2 is Bottom-Right (Output)
tmux send-keys -t $SESSION:0.2 "$DEFAULT_EDITOR output.txt" C-m

# 6. Select main left pane (Pane 0) so cursor starts inside the editor
tmux select-pane -t $SESSION:0.0

# 7. Attach to the session
tmux attach-session -t $SESSION
