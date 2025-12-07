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
set scrolloff=4


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
    setlocal signcolumn=auto
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

    hi Normal guifg=white
    hi Comment guifg=darkgray guibg=NONE
    hi Constant guifg=darkgray guibg=NONE
    hi Number guifg=darkgray guibg=NONE
    hi Float guifg=darkgray guibg=NONE
    hi String guifg=darkgray guibg=NONE
    hi Character guifg=darkgray guibg=NONE
    hi Boolean guifg=darkgray guibg=NONE

    hi Identifier guifg=white
    hi Function guifg=white
    
    hi Type guifg=white
    hi Typedef guifg=white
    hi StorageClass guifg=white
    hi Structure guifg=white

    hi PreProc guifg=white guibg=NONE
    hi PreCondit guifg=white guibg=NONE
    hi Macro guifg=white guibg=NONE
    hi Define guifg=white guibg=NONE
    hi Include guifg=white guibg=NONE

    hi StatusLine gui=bold guifg=white guibg=black

    hi Pmenu gui=NONE guifg=black guibg=white
    hi PmenuSel gui=BOLD guifg=black guibg=gray
    hi PmenuSbar gui=NONE guifg=black guibg=darkgray
    hi PmenuThumb gui=NONE guifg=black guibg=gray
    
    hi Error guifg=red guibg=NONE
    hi Repeat guifg=white guibg=NONE
    hi SignColumn guifg=white guibg=NONE

    hi Keyword guifg=white
    hi Directory guifg=white
    hi Statement guifg=white
    hi Operator guifg=white
    hi Special guifg=white
    
    hi LineNr gui=NONE guifg=darkgray
    hi CursorLineNr gui=bold guifg=darkgray
    
    hi DiffText guifg=white guibg=NONE
    hi ErrorMsg guifg=red guibg=NONE
    hi WarningMsg guifg=yellow guibg=NONE

endif
