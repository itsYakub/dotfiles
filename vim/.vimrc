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


set noshowmode
set laststatus=2
set statusline=\[%{mode(0)}\]\ %f\ %m
set statusline+=%=
set statusline+=%y\ %l:%v/%L\ (%p%%)


set syntax=clean
if has ("termguicolors")

    set termguicolors

    hi Normal term=NONE gui=NONE guifg=white ctermfg=15

    hi Keyword term=NONE gui=NONE guifg=white ctermfg=15

    hi Statement term=NONE gui=NONE guifg=white ctermfg=15

    hi Type term=NONE gui=NONE guifg=white ctermfg=15

    hi Identifier term=NONE gui=NONE guifg=white ctermfg=15

    hi Function term=NONE gui=NONE guifg=white ctermfg=15

    hi PreProc term=NONE gui=NONE guifg=white ctermfg=15

    hi Special term=NONE gui=NONE guifg=white ctermfg=15

    hi Operator term=NONE gui=NONE guifg=white ctermfg=15

    hi Pmenu term=NONE gui=NONE guifg=black ctermfg=0 guibg=white ctermbg=15

    hi PmenuSel term=NONE gui=NONE guifg=black ctermfg=0 guibg=gray ctermbg=7

    hi LineNr term=NONE gui=NONE guifg=darkgrey ctermfg=8

    hi CursorLineNr term=bold gui=bold guifg=darkgrey ctermfg=8

    hi Comment term=NONE gui=NONE guifg=darkgrey ctermfg=8

    hi String term=NONE gui=NONE guifg=darkgrey ctermfg=8

    hi Constant term=NONE gui=NONE guifg=darkgrey ctermfg=8

endif
