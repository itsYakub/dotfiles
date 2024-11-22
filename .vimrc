"               _                         
"      __   __ (_)  _ __ ___    _ __    ___ 
"      \ \ / / | | | '_ ` _ \  | '__|  / __|
"   _   \ V /  | | | | | | | | | |    | (__ 
"  (_)   \_/   |_| |_| |_| |_| |_|     \___|
"                                         
"
" Basics:
"
" Basics: line numbers
set number
set fillchars=eob:\ 
set scrolloff=8

" Basics: indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap

" Basics: leader
nnoremap <Space> <Nop>
let mapleader=" "

" Basics: search
set nohlsearch
set incsearch

" Basics: keymaps
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <C-w> :bd<CR>
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>
vnoremap <C-V> :r !xclip -o -sel c<CR><CR>

" Basics: comments
set formatoptions-=r
set formatoptions-=o

" Plugins:

" Plugins: Setup
call plug#begin()

Plug 'https://github.com/sainnhe/everforest'

Plug 'https://github.com/vim-airline/vim-airline'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

Plug 'junegunn/fzf'
Plug 'https://github.com/junegunn/fzf.vim'

Plug 'https://github.com/voldikss/vim-floaterm'

call plug#end()

" Plugins: everforest
" Important!!
if has('termguicolors')
    set termguicolors
endif

" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'

" For better performance
let g:everforest_better_performance = 1

colorscheme everforest

" Plugins: vim-airline
let g:airline#extensions#tabline#enabled = 1

" Plugins: vim-lsp
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

" Plugins: asyncomplete.vim

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

let g:asyncomplete_auto_popup = 1

" Plugins: asyncomplete-omni.vim

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options( {
\   'name': 'omni',
\   'allowlist': [ '*' ],
\   'completor': function('asyncomplete#sources#omni#completor'),
\   'config': {
\       'show_source_kind': 1,
\   },
\ } ))

" Plugins: fzf.vim
nnoremap <silent> <C-e> :Files<CR>
nnoremap <silent> <C-f> :Buffers<CR>

" Plugins: vim-floaterm
let g:floaterm_width=0.8
let g:floaterm_height=0.8

nnoremap <silent> <C-t> :FloatermToggle<CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermToggle<CR>

nnoremap <silent> <C-t-n> :FloatermNew<CR>
tnoremap <silent> <C-t-k> <C-\><C-n>:FloatermKill<CR>

nnoremap <silent> <C-t-n> :FloatermNew<CR>
tnoremap <silent> <C-t-k> <C-\><C-n>:FloatermKill<CR>
