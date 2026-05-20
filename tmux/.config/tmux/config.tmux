# config.tmux
# # # # # # #
#
# default-terminal: Set the default terminal for new windows created in this session - the default value of the TERM environment variable.
set -g default-terminal "tmux-256color"

# terminal-overrides: Allow terminal descriptions read using terminfo(5) to be overridden.
set -ag terminal-overrides ",*:Tc"

# mode-keys: emacs-style binding in copy-mode
setw -g mode-keys emacs

# set-titles: Attempt to set the client terminal title using the tsl and fsl terminfo
set -g set-titles on

# set-titles-string: String used to set the client terminal title if set-titles is on.
# #h: Hostname of local host (no domain name)
# #W: Name of window
set -g set-titles-string "#h: #W"

# base-index: Set the base index from which an unused index should be searched when a new window is created.
set -g base-index 1

# pane-base-index: Like base-index, but set the starting index for pane numbers.
setw -g pane-base-index 1

# renumber-windows: If on, when a window is closed in a session, automatically renumber the other windows in numerical order.
setw -g renumber-windows on
