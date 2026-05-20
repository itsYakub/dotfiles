" " " " " " " " " " " " " " " " " " " " " " "
"               _                         
"      __   __ (_)  _ __ ___    _ __    ___ 
"      \ \ / / | | | '_ ` _ \  | '__|  / __|
"   _   \ V /  | | | | | | | | | |    | (__ 
"  (_)   \_/   |_| |_| |_| |_| |_|     \___|
"                                         
" " " " " " " " " " " " " " " " " " " " " " "

if !filereadable(expand('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'morhertz/gruvbox', { 'as': 'gruvbox' }

call plug#end()

" :h shell
" "
"
" Name of the shell to use for ! and :! commands.
" "
set shell=/bin/bash

" :h number
" "
" 
" Print the line number in front of each line. 
" "
set number

" :h fillchars
" "
" 
" 'eob' (end-of-buffer) lines display a whitespace ('\ ')
" "
set fillchars=eob:\ 

" :h scrollof
" "
" 
" Minimal number of screen lines to keep above and below the cursor.
" "
set scrolloff=4

" :h tabstop
" "
"
" Defines the column multiple used to display the Horizontal Tab character (ASCII 9);
" "
set tabstop=4

" :h softtabstop 
" "
"
" Create soft tab stops, separated by 'softtabstop' number of columns.:
" "
set softtabstop=4

" :h shiftwidth
" "
"
" Number of columns that make up one level of (auto)indentation.
" "
set shiftwidth=4

" :h smartindent
" "
"
" Do smart autoindenting when starting a new line.
" "
set smartindent

" :h nowrap
" "
"
" This option changes how text is displayed.
" "
set nowrap

" :h expandtab
" "
"
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
" "
set expandtab

" :h mouse
" "
"
" Enable the use of the mouse.
" Modes:
" - n - Normal mode and Terminal modes
" - v - Visual mode
" - i - Insert mode
" - c - Command-line mode
" - h - all previous modes when editing a help file
" - a - all previous modes
" - r - for |hit-enter| and |more-prompt| prompt
" "
set mouse=a

" :h nohlsearch
" "
"
" When there is a previous search pattern, highlight all its matches.
" "
set nohlsearch

" :h incsarch
" "
"
" While typing a search command, show where the pattern, as it was typed so far, matches.
" "
set incsearch

" :h noshowmode
" "
"
" If in Insert, Replace or Visual mode put a message on the last line.
" "
set noshowmode

" :h netwr
" :h netwr-browser-settings
" :h netwr-browser-options
" :h netwr-browser-var
" "
"
" Set the default listing style:
" = 0: thin listing (one file per line)
" = 1: long listing (one file per line with time
"      stamp information and file size)
" = 2: wide listing (multiple files in columns)
" = 3: tree style listing
" "
let g:netrw_liststyle=3

" enable/suppress the banner
" =0: suppress the banner
" =1: banner is enabled (default)
" "
let g:netrw_banner=0

" Controlled by the "a" map (see |netrw-a|)
" =0 : show all
" =1 : show not-hidden files
" =2 : show hidden files only
"  default: =1
" "
let g:netrw_hide=1

" comma-separated pattern list for hiding files
" Patterns are regular expressions (see |regexp|)
" "
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

" :h laststatus
" "
"
" The value of this option influences when the last window will have a status line:
" 0: never
" 1: only if there are at least two windows
" 2: always
" "
set laststatus=2

" :h statusline 
" "
"
" When non-empty, this option determines the content of the status line.
" "
set statusline=%!_statln()
function! _statln()
    let line  = '[%{mode(0)}] %f %m '
    let line .= '%='
    let line .= '%y %l:%v/%L (%p%%)'
    return (line)
endfunction

" :h showtabline
" "
"
" The value of this option specifies when the line with tab page labels will be displayed:
" 0: never
" 1: only if there are at least two tab pages
" 2: always
" "
set showtabline=1

" :h syntax 
" "
"
" When this option is set, the syntax with this name is loaded, unless syntax highlighting has been switched off with ":syntax off".
" "
set syntax=clean
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    colorscheme catppuccin_mocha
endif

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
