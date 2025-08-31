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

" Statusline
set laststatus=2
set statusline=                 " left align
set statusline+=%2*\            " blank char for spacing
set statusline+=%2*\%{StatusLineMode()} 
set statusline+=%2*\            " blank char for spacing
set statusline+=%1*\ <<
set statusline+=%1*\ %f
set statusline+=%1*\ >>
set statusline+=%=              " right align
set statusline+=%*
set statusline+=%4*\%{b:gitbranch}
set statusline+=%3*\%l/%L\ |   " line count
set statusline+=%3*\%y          " file type
hi User1 ctermbg=black ctermfg=grey guibg=black guifg=grey
hi User2 ctermbg=green ctermfg=black guibg=green guifg=black
hi User3 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi User3 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen

" statusline functions
function! StatusLineMode()
    let l:mode=mode()
    if l:mode==#"n"
        return "NORMAL"
    elseif l:mode==?"v"
        return "VISUAL"
    elseif l:mode==#"i"
        return "INSERT"
    elseif l:mode==#"R"
        return "REPLACE"
    endif
endfunction

function! StatuslineGitBranch()
    let b:gitbranch=""
    if &modifiable
        try
            lcd %:p:h
        catch
            return
        endtry
        let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
        lcd -
        if l:gitrevparse!~"fatal: not a git repository"
            let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
        endif
    endif
endfunction

augroup GetGitBranch
autocmd!
autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

set listchars=tab:>>,trail:-,extends:>,precedes:<,nbsp:+

set autoread
set history=1000
set tabpagemax=50
