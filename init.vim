" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

call plug#end()

" Custom configuration 
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set t_Co=256
set splitright " split by adding new buffor on the right of existing one
set splitbelow " split by adding new buffor below of the existing one
set noshowmode " disable default modes showing
set tabstop=2 " set indenation size
set autoindent " enable auto indentation
set shiftwidth=2 " set size of tab
set number " show line numbers
set expandtab " change tab to space
set updatetime=100

" Deoplete configuration
let g:deoplete#enable_at_startup = 1

" Syntastic config
let g:syntastic_enable_signs = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']

" Indent guides configuration
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_conceallevel = 1
let g:indentLine_char = '│'
" Theme configuration
colorscheme monokai

" Lightline configuration

" Show full path of file
function! LightlineFilename()
  return expand('%:p')
endfunction

" Configure lighline plugin
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

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

" Fuzzy finder for all files in git repo or actual dir
function! s:with_git_root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  return v:shell_error ? {} : {'dir': root}
endfunction
command! -nargs=* Rag
  \ call fzf#vim#ag(<q-args>, extend(s:with_git_root(), g:fzf#vim#default_layout))
nmap <C-S> :Ag<CR>

" NerdTree
nmap <C-\> :NERDTreeToggle<CR>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Toggle syntastic
nmap <F6> :SyntasticToggleMode<CR>
nmap <F7> :SyntasticCheck<CR>

" Multicursor configuration
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_quit_key            = '<Esc>'
