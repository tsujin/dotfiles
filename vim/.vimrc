if &compatible
  set nocompatible
endif

scriptencoding utf-8
set encoding=utf-8

" Set backspace/tab behavior
set backspace=indent,eol,start
set smarttab

" File/line formmatting options
syntax on
set number
set nosmartindent
set nojoinspaces
set ruler
set scrolloff=1
set sidescroll=1
set sidescrolloff=2
set display+=lastline
set expandtab

" --PYTHON CONFIGURATION--
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set cc=79 |
	\ set autoindent |
	\ set fileformat=unix
let python_highlight_all=1

" Number gutter
set norelativenumber
set numberwidth=3

" Better searching
set hlsearch
set incsearch
set smartcase ignorecase

" Better toggle for normal mode
inoremap jk <Esc>

" Statusline
set laststatus=2

set listchars=tab:>>,trail:-,extends:>,precedes:<,nbsp:+

set autoread
set history=1000
set tabpagemax=50

" -- PLUGINS BEGIN --

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Check for missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endifA

" Call our plugins
call plug#begin()
        Plug 'vim-scripts/indentpython.vim'
        Plug 'Valloric/YouCompleteMe'
        Plug 'vim-syntastic/syntastic'
        Plug 'nvie/vim-flake8'
        Plug 'preservim/nerdtree'
        Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
call plug#end()

" NERDTree Configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
