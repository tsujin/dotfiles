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
set sw=4 et
set tabstop=4
set ts=8
set tw=79 cc=79
set nosmartindent
set nojoinspaces
set ruler
set laststatus=2
set scrolloff=1
set sidescroll=1
set sidescrolloff=2
set display+=lastline

" Number gutter
set norelativenumber
set numberwidth=3

" Better searching
set hlsearch
set incsearch
set smartcase ignorecase

" Better toggle for normal mode
inoremap jk <Esc>

set listchars=tab:>>,trail:-,extends:>,precedes:<,nbsp:+

set autoread
set history=1000
set tabpagemax=50
