# keybind.tmux
# # # # # # # #
#
# new-window: Create a new window.
# -c: start-directory
# pane_current_path: Current path if available
bind c new-window -c "#{pane_current_path}"
