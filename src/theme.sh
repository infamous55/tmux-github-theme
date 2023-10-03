#!/usr/bin/env bash

# exit on errors, catch uninitialized variable references,
# provide debugging information, and ensure that pipelines fail
# when any component fails
set -euxo pipefail

# for when another locale is set on the target system
export LC_ALL=en_US.UTF-8

# include the other files
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/utils.sh"
source "$CURRENT_DIR/colors.sh"

# activity style and bell style,
# check https://man.openbsd.org/OpenBSD-current/man1/tmux.1#acs
# for more options
tmux set-window-option -g window-status-activity-style "italics"
tmux set-window-option -g window-status-bell-style "bold"

# status style
tmux set-option -g status-style "bg=#0d1117,fg=#ffffff"

# message style
tmux set-option -g message-style "bg=#f7768e,fg=#1f2335"

# border color
tmux set-option -g pane-active-border-style "fg=#737aa2"
tmux set-option -g pane-border-style "fg=#292e42"

# left side
tmux set-option -g status-left-length 100
tmux set-option -g status-left "$(generate_left_side_string)"

# windows
tmux set-window-option -g window-status-separator ''
tmux set-window-option -g window-status-format "$(generate_inactive_window_string)"
tmux set-window-option -g window-status-current-format "$(generate_active_window_string)"

# right side
tmux set-option -g status-right-length 100
tmux set-option -g status-right "$(generate_right_side_string)"
