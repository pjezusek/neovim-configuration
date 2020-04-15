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

" Set python environment
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim-python2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim-python3/bin/python'
let g:ruby_host_prog = $HOME . '/.rvm/rubies/ruby-2.7.0/bin/ruby'

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
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

" Load project type configuration
call lib#LoadProjectTypeConfig()

" Folding style
highlight Folded cterm=bold " no underline
function! MyFoldText()
    let line = getline(v:foldstart)
    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 5 " Change this number into flair character length
    let foldedlinecount = v:foldend - v:foldstart
    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
        let fillcharcount = windowwidth - strdisplaywidth(line) - len(foldedlinecount)
    return line . ' ...' . repeat(" ",fillcharcount) . foldedlinecount . '' . ' '
endfunction
set foldtext=MyFoldText()

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
