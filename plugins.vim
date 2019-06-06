" File: plugins.vim
" Description: List of plugins (manage by vim-plug) with their configurations

" Autoinstall vim-plug if it is needed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  augroup vim_plug
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup end
endif

" List of plugins
call plug#begin('~/.local/share/nvim/plugged')

  " THEME "
  """""""""

  " Name: Gruvbox
  " Description: Theme
  Plug 'morhetz/gruvbox'

  " Name: Vim airline
  " Description: Status bar and more
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " SEARCHING AND MOVEMENT "
  """"""""""""""""""""""""""

  " Name: FZF
  " Description: Fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Name: NERDTree, NERDTree-git-plugin
  " Description: File tree manager
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Name: Easymotion
  " Description: Fast jumping
  Plug 'easymotion/vim-easymotion'

  " Name: Far
  " Description: Find and replace tool
  Plug 'brooth/far.vim'

  " CODE REPOSITORY "
  """""""""""""""""""

  " Name: Fugitive
  " Description: Wrapper for git commands
  Plug 'tpope/vim-fugitive'

  " EDITING "
  """""""""""

  " Name: Multiple cursors
  " Description: Editing multiple places in the same time
  Plug 'terryma/vim-multiple-cursors'

  " Name: Surround
  " Description: Fast editing surrounding characters
  Plug 'tpope/vim-surround'

  " Name: Ultisnips
  " Description: Engine for snippets
  Plug 'SirVer/ultisnips'

  " Name: Snippets
  " Description: Pack of common snippets supported by Ultisnips
  Plug 'honza/vim-snippets'

  " Name: UndoTree
  " Description: Permanent undo tree
  Plug 'mbbill/undotree'

  " Name: Deoplete
  " Description: Completion engine
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Name: Tagbar
  " Description: Easy tags browser
  Plug 'majutsushi/tagbar'

  " BACKGROUND WORKERS "
  """"""""""""""""""""""

  " Name: Neomake
  " Description: Asynchronous linting and make framework
  Plug 'neomake/neomake'

  " Name: LanguageClient
  " Description: Client for language servers
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

  " SPECIFIC LANGUAGES/FRAMEWORKS/ENVIRONMENTS "
  """""""""""""""""""""""""""""""""

  " Name: Vim rails
  " Description: Support tool for rails projects
  Plug 'tpope/vim-rails'

  " Name: CSV vim
  " Description: Better editing csv files
  Plug 'chrisbra/csv.vim'

  " Name: Diffconflicts
  " Description: Better vimdiff tool
  Plug 'whiteinge/diffconflicts'
call plug#end()

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Configuration

" FZF "
"""""""
let g:fzf_layout = { 'down': '~50%' }

" Hide status line if fzf is on
augroup fzf
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler showtabline=0
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler showtabline=2
augroup end

" NERDTree "
""""""""""""
let g:NERDTreeWinSize=40
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1

" Gruvbox "
"""""""""""
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" Multiple cursor "
"""""""""""""""""""
let g:multi_cursor_use_default_mapping =  0

" UndoTree "
""""""""""""
if has('persistent_undo')
    set undodir=~/.undodir/
    set undofile
endif

" Deoplete "
""""""""""""
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ 'ruby': ['LanguageClient', 'buffer', 'around', 'tag'],
\ 'python3': ['buffer', 'around', 'tag'],
\ 'javascript': ['buffer', 'around', 'tag'],
\ 'vim': ['buffer', 'around', 'tag'],
\ 'c': ['LanguageClient', 'buffer', 'around', 'tag'],
\ 'cpp': ['LanguageClient', 'buffer', 'around', 'tag'],
\ 'sh': ['buffer', 'around', 'tag'],
\ 'arduino': ['buffer', 'around', 'tag'],
\ 'matlab': ['buffer', 'around', 'tag']
\})
let deoplete#tag#cache_limit_size = 5000000
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" fix problem with multicursor
function g:Multiple_cursors_before()
 call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
 call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction

" Neomake "
"""""""""""
call neomake#configure#automake('nrwi', 500)
let g:neomake_tempfile_dir = '/tmp/'
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
\ 'exe': 'clang++',
\ 'args': ['-Wall', '-Isrc'],
\ }

" Far "
"""""""
let g:far#source = 'ag'
let g:far#window_layout = 'tab'
let g:far#default_file_mask = './*'
let g:far#cwd = lib#ProjectRoot()

" LanguageClient "
""""""""""""""""""
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': [ 'solargraph', 'stdio' ],
    \ 'c': [ 'clangd' ],
    \ 'cpp': [ 'clangd' ]
    \ }

" Tagbar "
""""""""""
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

" Vim airline "
"""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
