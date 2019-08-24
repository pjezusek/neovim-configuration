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
  " Theme {{{
  " Name: Gruvbox
  " Description: Theme
  Plug 'morhetz/gruvbox'

  " Name: Vim airline
  " Description: Status bar and more
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " }}}

  " Searching and movement {{{
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
  " }}}

  " Code repository {{{
  " Name: Fugitive
  " Description: Wrapper for git commands
  Plug 'tpope/vim-fugitive'
  " }}}

  " Editing {{{
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

  " Name: Tagbar
  " Description: Easy tags browser
  Plug 'majutsushi/tagbar'

  " Name: commentary
  " Description: Easy comments
  Plug 'tpope/vim-commentary'

  " Name: devicons
  " Description: Icons
  Plug 'ryanoasis/vim-devicons'
  " }}}

  " Background workers {{{
  " Name: Neomake
  " Description: Asynchronous linting and make framework
  Plug 'neomake/neomake'

  " Name: Coc.nvim
  " Description: Client for language servers
  " Use release branch
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " }}}

  " Specific languages/frameworks/environments {{{
  " Name: Vim rails
  " Description: Support tool for rails projects
  Plug 'tpope/vim-rails'

  " Name: CSV vim
  " Description: Better editing csv files
  Plug 'chrisbra/csv.vim'

  " Name: Diffconflicts
  " Description: Better vimdiff tool
  Plug 'whiteinge/diffconflicts'

  " Name: vim-javascript
  " Description: Better javascript syntax highlighting
  Plug 'pangloss/vim-javascript'
  " }}}
call plug#end()

" Configuration

" FZF {{{
let g:fzf_layout = { 'down': '~50%' }

" Hide status line if fzf is on
augroup fzf
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler showtabline=0
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler showtabline=2
augroup end
" }}}

" NERDTree {{{
let g:NERDTreeWinSize=60
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos='right'
" }}}

" Gruvbox {{{
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
" }}}

" Multiple cursor {{{
let g:multi_cursor_use_default_mapping =  0
" }}}

" UndoTree {{{
if has('persistent_undo')
    set undodir=~/.undodir/
    set undofile
endif
" }}}

" Neomake {{{
call neomake#configure#automake('nrwi', 500)
let g:neomake_tempfile_dir = '/tmp/'
" }}}

" Far {{{
let g:far#source = 'ag'
let g:far#window_layout = 'tab'
let g:far#default_file_mask = './*'
let g:far#cwd = lib#ProjectRoot()
" }}}

" Tagbar {{{
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
" }}}

" Vim airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#coc#enabled = 1
" }}}

" vim-javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
" }}}

" Coc.vim {{{
" Map <tab> for trigger completion, completion confirm, snippet expand and jump like VSCode.c
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-J> and <C-K> to navigate the completion list:

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

let g:coc_snippet_next = '<tab>'

" use ctrl+space to trigger autocopletion
inoremap <silent><expr> <c-space> coc#refresh()

autocmd FileType * let b:coc_root_patterns = ['.git', '.env']
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}
