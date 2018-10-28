call plug#begin('~/.local/share/nvim/plugged')
  " Status line
  Plug 'itchyny/lightline.vim'
  " Fuzzy files finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Wrapper for fzf that adds support fzf in vim
  Plug 'junegunn/fzf.vim'
  " Git wrapper for vim
  Plug 'tpope/vim-fugitive'
  " File browser
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Mark changed lines
  Plug 'airblade/vim-gitgutter'
  " Theme
  Plug 'crusoexia/vim-monokai'
  " Surrond plugin
  Plug 'tpope/vim-surround'
  " Indent guides
  Plug 'Yggdroot/indentLine'
  " Search and replace
  Plug 'brooth/far.vim'
  " Ruby support
  Plug 'vim-ruby/vim-ruby'
  " Syntax linter
  Plug 'scrooloose/syntastic'
  " Autocompletion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Multiple cursors
  Plug 'terryma/vim-multiple-cursors'
  " Markdown preview
  Plug 'iamcco/markdown-preview.vim'
  " Typescript syntax
  Plug 'leafgarland/typescript-vim'
  " Visualisation of history of file
  Plug 'mbbill/undotree'
  " Tagbar with tags
  Plug 'majutsushi/tagbar'
  " Quick jumps
  Plug 'easymotion/vim-easymotion'
call plug#end()

" General
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set t_Co=256
set splitright " split by adding new buffor on the right of existing one
set splitbelow " split by adding new buffor below of the existing one
set noshowmode " disable default modes showing
set nowrap " Do not wrap long lines
set tabstop=2 " set indenation size
set autoindent " enable auto indentation
set shiftwidth=2 " set size of tab
set number " show line numbers
set expandtab " change tab to space
set updatetime=100
set number relativenumber " set relative numbers
set history=1000 " expand history size
set hidden " allow buffer switching without saving
set iskeyword-=. " '.' is an end of word designator
set iskeyword-=# " '#' is an end of word designator
set iskeyword-=- " '-' is an end of word designator
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

let mapleader = ','

" Clipboard
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
      set clipboard=unnamed,unnamedplus
    else
      set clipboard=unnamed
  endif
endif

" Deoplete configuration
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('max_list', 10)
" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Syntastic config
let g:syntastic_enable_signs = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_mode_map = { 'mode': 'passive' }

let g:syntastic_is_open = 0
function! SyntasticToggle()
  if g:syntastic_is_open == 1
      lclose
      let g:syntastic_is_open = 0
  else
      Errors
      let g:syntastic_is_open = 1
  endif
endfunction
" Toggle syntastic
nmap <F6> :SyntasticToggleMode<CR>
map <F7> :call SyntasticToggle()<CR>

" Indent guides configuration
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_conceallevel = 1
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['markdown']

" Theme configuration
colorscheme monokai

" Deoplete configuration
call deoplete#custom#option('max_list', 5)

" NERDTree configuration
let g:NERDTreeWinSize=60

" Lightline configuration

" Show full path of file
function! LightlineFilename()
  return expand('%F')
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'], ['gitbranch']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

" Fuzzy finder configuration

" Fuzzy finder for files from git repository
function! s:find_git_root()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
nmap <C-P> :ProjectFiles<CR>

" Fuzzy finder for opened buffers
nmap <C-E> :Buffers<CR>

" Fuzzy finder for current buffer
nmap <C-F> :BLines<CR>

" Fuzzy finder for changed files
nmap <A-\> :GFiles?<CR>

nmap <C-H> :History:<CR>

" Fuzzy finder for all files and it's content in git repo or actual dir
function! s:with_git_root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  return v:shell_error ? {} : {'dir': root}
endfunction
command! -nargs=* Rag
  \ call fzf#vim#ag(<q-args>, extend(s:with_git_root(), g:fzf#vim#default_layout))
nmap <C-S> :Ag<CR>


" Multicursor configuration

" Disable default mapping
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_quit_key            = '<C-c>'
let g:multi_cursor_next_key            = '<C-n>'

" NerdTree configuration
nmap <C-\> :NERDTreeToggle<CR>

" Git fugitive configuration
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gl :Glog<CR>

" Undotree configuration
nnoremap <leader>u :UndotreeToggle<cr>
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" Tagbar configuration
nmap <silent> <leader>tt :TagbarToggle<CR>

" Key mapping

" Map C-c to ESC
nmap <C-c> <ESC>
imap <C-c> <ESC>
vmap <C-c> <ESC>
xmap <C-c> <ESC>
smap <C-c> <ESC>
cmap <C-c> <ESC>
omap <C-c> <ESC>

" Simpler noh
nmap <leader>nh :noh<CR>
