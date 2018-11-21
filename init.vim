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
  " Autocompletion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Multiple cursors
  Plug 'terryma/vim-multiple-cursors'
  " Markdown preview
  Plug 'iamcco/markdown-preview.vim'
  " Visualization of history of file
  Plug 'mbbill/undotree'
  " Tagbar with tags
  Plug 'majutsushi/tagbar'
  " Quick jumps
  Plug 'easymotion/vim-easymotion'
  " Comment blocks, lines etc.
  Plug 'tpope/vim-commentary'
  " Yanks stack
  Plug 'maxbrunsfeld/vim-yankstack'
  " Vimgrep
  Plug 'dkprice/vim-easygrep'
  " Better word splitting
  Plug 'bkad/CamelCaseMotion'
  " Async run neovim makers
  Plug 'neomake/neomake'
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
set tags=.tags
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

" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Indent guides configuration
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_conceallevel = 1
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['markdown']

" Theme configuration
colorscheme monokai

" Deoplete configuration
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('max_list', 10)
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'tag']
let deoplete#tag#cache_limit_size = 5000000

" NERDTree configuration
let g:NERDTreeWinSize=60
map <leader>\ :NERDTreeFind<cr>

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
nmap <C-E> :Buffers<CR>
nmap <C-F> :Tags<CR>
nmap <silent><leader>bl :BLines<CR>
nmap <silent><leader>gf :GFiles?<CR>
nmap <silent><leader>hi :History:<CR>

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
let g:tagbar_autoclose=1
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = -1
if executable('ripper-tags')
  let g:tagbar_type_ruby = {
      \ 'kinds'      : ['m:modules',
                      \ 'c:classes',
                      \ 'C:constants',
                      \ 'F:singleton methods',
                      \ 'f:methods',
                      \ 'a:aliases'],
      \ 'kind2scope' : { 'c' : 'class',
                       \ 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : 'ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
endif

" Vim Yankstack configuration
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Markdown preview configuration
let g:mkdp_path_to_chrome = "google-chrome"
nmap <silent><leader>mp :MarkdownPreview<CR>
nmap <silent><leader>ms :MarkdownPreviewStop<CR>

" CamelCaseMotion configuration
call camelcasemotion#CreateMotionMappings('<leader>')
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Vim easygrep configuration
let g:EasyGrepReplaceWindowMode=2
let g:EasyGrepRecursive=1
let g:EasyGrepCommand=1
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Neomake configuration 
call neomake#configure#automake('nrwi', 500)

" Key mapping

" Map C-c to ESC
nmap <C-c> <ESC>
imap <C-c> <ESC>
vmap <C-c> <ESC>
xmap <C-c> <ESC>
smap <C-c> <ESC>
cmap <C-c> <ESC>
omap <C-c> <ESC>

" Buffers
" Close current buffer
map <leader>bd :bd<cr>

" Close all buffers
map <leader>ba :1,1000 bd!<cr>

" Simpler noh
nmap <leader>nh :noh<CR>

" Ripper-tags shortcut
nmap <leader>rt :NeomakeSh ripper-tags -R -f .tags --exclude=@.gitignore<CR>

" Rubocop autocorrect
nmap <leader>rca :!rubocop -a %<CR>

" Remap save and quit commands
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Add mapping for quickfix list
map <leader>lw :lwindow<CR>
map <leader>lp :lprev<CR>
