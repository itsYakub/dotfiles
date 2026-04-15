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

set shell=/bin/bash

set number
set fillchars=eob:\ 
set scrolloff=4

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set expandtab

set mouse=a

set nohlsearch
set incsearch

nnoremap <silent> <C-w> :bd<CR>

set noshowmode
set laststatus=2
set statusline=%!_statln()
function! _statln()
    let line  = '[%{mode(0)}] %f %m '
    let line .= '%='
    let line .= '%y %l:%v/%L (%p%%)'
    return (line)
endfunction

set syntax=clean
if has ("termguicolors")
    set termguicolors
    colorscheme catppuccin_mocha
endif

let g:fzf_vim = { }
let g:fzf_layout = { "window": { "width": 1.0, "height": 1.0, "border": "none" } }
nnoremap <silent> <C-e> :Files<CR>
nnoremap <silent> <C-f> :Buffers<CR>
autocmd FileType fzf tnoremap <buffer> <C-w> <C-c>

" NOTE:	for this mapping, we need to have two <Esc> tags.
"       Otherwise, on some machines, there would be an error E21
" tnoremap <Esc> <C-\><C-n>			<-- wrong
" tnoremap <Esc><Esc> <C-\><C-n>	<-- correct
tnoremap <Esc><Esc> <C-\><C-n>
