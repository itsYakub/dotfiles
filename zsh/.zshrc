# SECTION: setopt
# # # # # # # # #
setopt PROMPT_SUBST
setopt inc_append_history

# SECTION: Prompt
# # # # # # # # #
PROMPT='%n@%m:%~$ '
RPROMPT='$(git symbolic-ref --short HEAD 2>/dev/null)'

# SECTION: Aliases
# # # # # # # # # #
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias mv='mv -i'
alias clear='printf "\033[2J\033[3J\033[1;1H"' # This is the alias especially handy for kitty terminal (and it's scrollback)

# SECTION: History
# # # # # # # # # #
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# SECTION: Environ. Variables
# # # # # # # # # # # # # # #

export LOCAL=$HOME/.local
export PATH=$PATH:$LOCAL/bin

# SECTION: Completion system
# # # # # # # # # # # # # # #
autoload -Uz compinit
compinit
