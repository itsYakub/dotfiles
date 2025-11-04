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
" " " " "
" Basics:
" " " " "
"
" " " " " " " " " " " "
" Basics: line numbers
" " " " " " " " " " " "
set number
set fillchars=eob:\ 
set scrolloff=8



" " " " " " " " " " "
" Basics: indentation
" " " " " " " " " " "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
" For indentation using SPACES (' ')
set expandtab
" For indentation using TABS ('\t')
" set noexpandtab



" " " " " " " " "
" Basics: search
" " " " " " " " "
set nohlsearch
set incsearch



" " " " " " " " "
" Basics: keymaps
" " " " " " " " "
tnoremap <Esc><Esc> <C-\><C-n>
nnoremap <silent> <C-w> :bd<CR>

" NOTE:	for this mapping, we need to have two <Esc> tags.
"       Otherwise, on some machines, there would be an error E21
" tnoremap <Esc> <C-\><C-n>			<-- wrong
" tnoremap <Esc><Esc> <C-\><C-n>	<-- correct



" " " " " " " " " "
" Basics: comments
" " " " " " " " " "
set formatoptions-=r
set formatoptions-=o



" " " " " " " " " "
" Basics: clipboard
" " " " " " " " " "
set clipboard=unnamedplus



" " " " " " " "
" Basics: other
" " " " " " " "
set shell=/bin/bash





" " " " " "
" Plugins:
" " " " " "
"
" " " " " " " " "
" Plugins: Setup
" " " " " " " " "

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

Plug 'sainnhe/everforest'
Plug 'catppuccin/vim'
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()



" " " " " " " " "
" Section: Theme
" " " " " " " " "
"
" colorscheme everforest
" colorscheme gruvbox
colorscheme catppuccin_mocha

if has('termguicolors')
    set termguicolors
endif


" " " " " " " " " " "
" Plugins: Everforest
" " " " " " " " " " "
"
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'

" For better performance
let g:everforest_better_performance = 1



" " " " " " " " " " " "
" Plugins: vim-airline
" " " " " " " " " " " "
let g:airline#extensions#tabline#enabled = 1



" " " " " " " " " "
" Plugins: vim-lsp
" " " " " " " " " "
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gt <plug>(lsp-type-definition)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END



" " " " " " " " " " " " " "
" Plugins: asyncomplete.vim
" " " " " " " " " " " " " "

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

let g:asyncomplete_auto_popup = 1



" " " " " " " " " " " " " " " " "
" Plugins: asyncomplete-omni.vim
" " " " " " " " " " " " " " " " "

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options( {
\   'name': 'omni',
\   'allowlist': [ '*' ],
\   'completor': function('asyncomplete#sources#omni#completor'),
\   'config': {
\       'show_source_kind': 1,
\   },
\ } ))




" " " " " " " " " "
" Plugins: fzf.vim
" " " " " " " " " "
nnoremap <silent> <C-e> :Files<CR>
nnoremap <silent> <C-f> :Buffers<CR>
