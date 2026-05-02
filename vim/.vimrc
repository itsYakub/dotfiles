" " " " " " " " " " " " " " " " " " " " " " "
"               _                         
"      __   __ (_)  _ __ ___    _ __    ___ 
"      \ \ / / | | | '_ ` _ \  | '__|  / __|
"   _   \ V /  | | | | | | | | | |    | (__ 
"  (_)   \_/   |_| |_| |_| |_| |_|     \___|
"                                         
" " " " " " " " " " " " " " " " " " " " " " "
"
"
" " " " " "
" Plugins:
" " " " " "

if !filereadable(expand('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

call plug#end()

" " " " "
" Config:
" " " " "

" Name of the shell to use for ! and :! commands.
set shell=/bin/bash

" Print the line number in front of each line. 
set number

" 'eob' (end-of-buffer) lines display a whitespace ('\ ')
set fillchars=eob:\ 

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=4

" Defines the column multiple used to display the Horizontal Tab character (ASCII 9);
set tabstop=4

" Create soft tab stops, separated by 'softtabstop' number of columns.
set softtabstop=4

" Number of columns that make up one level of (auto)indentation.
set shiftwidth=4

" Do smart autoindenting when starting a new line.
set smartindent

" This option changes how text is displayed.
set nowrap

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set expandtab

" Enable the use of the mouse.
" Modes:
" - n - Normal mode and Terminal modes
" - v - Visual mode
" - i - Insert mode
" - c - Command-line mode
" - h - all previous modes when editing a help file
" - a - all previous modes
" - r - for |hit-enter| and |more-prompt| prompt
set mouse=a

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" While typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch

" If in Insert, Replace or Visual mode put a message on the last line.
set noshowmode

" When this option is set, the syntax with this name is loaded, unless syntax highlighting has been switched off with ":syntax off".
set syntax=clean
if has ("termguicolors")
    set termguicolors
    colorscheme catppuccin_mocha
endif

" All configuration values for this plugin are stored in `g:fzf_vim` dictionary,
" so make sure to initialize it before assigning any configuration values to it.
let g:fzf_vim = { }

" Determines the size and position of fzf window
let g:fzf_layout = { "window": { "width": 1.0, "height": 1.0, "border": "none" } }

" On CTRL+e: Files (runs  `$FZF_DEFAULT_COMMAND`  if defined)
nnoremap <silent> <C-e> :Files<CR>

" On CTRL+f: Open buffers
nnoremap <silent> <C-f> :Buffers<CR>

" NOTE:	for this mapping, we need to have two <Esc> tags.
"       Otherwise, on some machines, there would be an error E21
" tnoremap <Esc> <C-\><C-n>			<-- wrong
" tnoremap <Esc><Esc> <C-\><C-n>	<-- correct
tnoremap <Esc><Esc> <C-\><C-n>

" The value of this option influences when the last window will have a status line:
" 0: never
" 1: only if there are at least two windows
" 2: always
set laststatus=2

" When non-empty, this option determines the content of the status line.
set statusline=%!_statln()
function! _statln()
    let line  = '[%{mode(0)}] %f %m '
    let line .= '%='
    let line .= '%y %l:%v/%L (%p%%)'
    return (line)
endfunction

" The value of this option specifies when the line with tab page labels will be displayed:
" 0: never
" 1: only if there are at least two tab pages
" 2: always
set showtabline=1

command! -nargs=0 Skeleton call _skeleton()
function! _skeleton()
    " get file extension
    let l:ext = expand('%:e')
    if empty(l:ext) " usually case for a file with no ext.: Makefile, Dockerfile etc.
        let l:ext = &filetype
    endif
    if empty(l:ext) " unsupported file type...
        echoerr 'Invalid file type: ' . l:ext
        return
    endif

    " get the template file
    let l:template = expand('~/.vim/templates/skeleton.' . l:ext)
    if !filereadable(l:template)
        echoerr 'No template found: ' . l:template
        return
    endif

    " insert template
    execute '0r ' . fnameescape(l:template)
endfunction
