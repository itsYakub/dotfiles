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

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

Plug 'catppuccin/vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" " " " "
" Config:
" " " " "

set shell=/bin/bash


set number
set fillchars=eob:\ 
set scrolloff=8


set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set expandtab


set nohlsearch
set incsearch


set clipboard=unnamedplus

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options( {
\   'name': 'omni',
\   'allowlist': [ '*' ],
\   'completor': function('asyncomplete#sources#omni#completor'),
\   'config': {
\       'show_source_kind': 1,
\   },
\ } ))

let g:asyncomplete_auto_popup = 1


colorscheme catppuccin_mocha
if has ('termguicolors')
    set termguicolors
endif

if has ('syntax')
    syntax clear
endif


set laststatus=2
set noshowmode
set statusline=\[%{mode(0)}\]\ %f\ %m
set statusline+=%=
set statusline+=%y\ %l:%v/%L\ (%p%%)


" NOTE:	for this mapping, we need to have two <Esc> tags.
"       Otherwise, on some machines, there would be an error E21
" tnoremap <Esc> <C-\><C-n>			<-- wrong
" tnoremap <Esc><Esc> <C-\><C-n>	<-- correct

tnoremap <Esc><Esc> <C-\><C-n>
nnoremap <silent> <C-w> :bd<CR>
nnoremap <silent> <C-e> :Files<CR>
nnoremap <silent> <C-f> :Buffers<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gt <plug>(lsp-type-definition)
endfunction
