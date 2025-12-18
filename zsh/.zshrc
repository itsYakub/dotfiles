# SECTION: Prompt
# # # # # # # # #

setopt prompt_subst

function lprompt() {
    echo "%n@%m:%~$ "
}

function rprompt() {
    gb="$(git symbolic-ref --short HEAD 2>/dev/null)" || return

    if git diff --exit-code --quiet; then
        echo "[ $gb ]";
    else
        echo "[ $gb [+] ]";
    fi
}

PROMPT='$(lprompt)'
RPROMPT='$(rprompt)'

# SECTION: Aliases
# # # # # # # # # #

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias mv='mv -i'
alias clear='printf "\033[2J\033[3J\033[1;1H"'

# SECTION: History
# # # # # # # # # #

setopt inc_append_history

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
