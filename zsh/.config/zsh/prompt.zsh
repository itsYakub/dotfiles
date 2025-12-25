#!/usr/bin/env zsh

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
