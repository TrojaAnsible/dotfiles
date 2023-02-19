" vimrc, R.Wobst, 6.12.2003

set nocompatible
set autoindent
set shiftwidth=4
set showmode
set showmatch
set showcmd
set ruler
set nojoinspaces
set cpo+=$
set whichwrap=""
set modelines=0
"colorscheme peachpuff
"set term=linux
"set number
set scrolloff=3

" column-width visual indication
"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#001D2F

filetype plugin indent on
syntax enable
hi DiffAdd ctermfg=Gray
let python_highlight_all = 1

set makeprg=gcc\ -o\ %<\ %

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" ~/.vimrc ends here
