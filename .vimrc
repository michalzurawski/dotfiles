" -----------------------------------------------------------------------------
set nocompatible             " be iMproved, required
filetype off                 " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/vimshell'
Plugin 'ternjs/tern_for_vim'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" -----------------------------------------------------------------------------

set number              " show line numbers
syntax enable           " enable syntax processing
set tabstop=4           " number of visual spaces per TAB
set expandtab           " use spaces for tabs
set softtabstop=2       " 2 space tab
set shiftwidth=2
autocmd BufRead,BufNewFile *.go setlocal noexpandtab "do not use space for tabs in go
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching parantheses
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <space> :nohlsearch<CR>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

set ignorecase
set foldmethod=syntax   " fold based on syntax
set foldnestmax=5       " max depth
set foldenable          " enable folding
set foldlevelstart=1000 " open every folds by default
set tags=tags;
" au FileType java set tags^=~/.tags
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set noswapfile
set nobackup
set nowb

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us "language check for md files
autocmd BufRead,BufNewFile *.yaml setlocal spell spelllang=en_us "language check for yaml files

set exrc "enables project-specific .vimrc
set secure "disables unsafe commands

colorscheme delek
"colorscheme selenized

autocmd VimEnter * NERDTree "starts nerdtree

set ttyfast "optimize for fast terminal connections

let g:signify_vcs_list              = [ 'git' ]
let g:signify_cursorhold_insert     = 1
let g:signify_cursorhold_normal     = 1

" gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
