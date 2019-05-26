" Ensure that compatibility with vi is disabled
set nocompatible

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

" Set settings for <Tab>

" Default
set tabstop=2
set shiftwidth=2
set expandtab

" Java
augroup tab_settings
  autocmd!
  autocmd FileType java setlocal shiftwidth=4 tabstop=4
augroup END

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
command! -nargs=1 Search :silent grep! <args> | :copen

" Preview window height
set previewheight=30

" Tags file
set tags=.tags

" Signcolumns
set signcolumn=yes

" Cmd height
set cmdheight=1

" Set autoread
set autoread

" Always show tab line
set showtabline=2

" Set tabline
set tabline=%!lib#TabLineConfiguration()

" No mode line
set noshowmode 

" set python environment
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim-python2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim-python3/bin/python'

