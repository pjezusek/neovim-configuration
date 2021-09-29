" Ensure that compatibility with vi is disabled
set nocompatible

set encoding=UTF-8

" Set line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Enable syntax
syntax enable

" Enable file type detection, plugins and indentation
filetype plugin indent on

" Set splitting settings
set splitright
set splitbelow

" Set no wraping
set nowrap

" Default
set tabstop=2
set shiftwidth=2
set expandtab

" Copy indentation from previous file
set autoindent

" Use system clipboard
if has('clipboard')
  if has('unnamedplus')
      set clipboard=unnamed,unnamedplus
    else
      set clipboard=unnamed
  endif
endif

" Use Silver Searcher istead of system grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Preview window height
set previewheight=30

" Tags file
set tags=.tags

" Signcolumns
set signcolumn=yes

" Set autoread
set autoread

" No mode line
set noshowmode

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup unwanted_white_chars
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
augroup END

set scrolloff=2

" Filetypes
augroup filetypedetect
    au BufRead,BufNewFile *.thor setfiletype ruby
augroup END

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Ignorecase
set ignorecase

set smartcase
set ignorecase
set inccommand=split

" Allow to hide unsaved buffers
set hidden

" Add cfilter package
packadd cfilter

" Fix sql dynamic completion
let g:omni_sql_no_default_maps = 1

" Cursor line
set cursorline
