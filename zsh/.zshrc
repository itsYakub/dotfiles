#!/usr/bin/env zsh

if [ -d $HOME/.config/zsh ]; then
    _config="$HOME/.config/zsh/config"
    
    if [ -f $_config ]; then
        source $_config
    fi
fi
