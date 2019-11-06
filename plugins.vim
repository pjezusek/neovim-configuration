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

  " Name: vim-airline
  " Description: Status bar and more
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " }}}

  " Searching and movement {{{
  " Name: fzf.vim
  " Description: Fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Name: NERDTree, NERDTree-git-plugin
  " Description: File tree manager
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Name: Far
  " Description: Find and replace tool
  Plug 'brooth/far.vim'
  " }}}

  " Editing {{{
  " Name: vim-multiple-cursors
  " Description: Editing multiple places in the same time
  Plug 'terryma/vim-multiple-cursors'

  " Name: vim-surround
  " Description: Fast editing surrounding characters
  Plug 'tpope/vim-surround'

  " Name: UndoTree
  " Description: Permanent undo tree
  Plug 'mbbill/undotree'

  " Name: vim-commentary
  " Description: Easy comments
  Plug 'tpope/vim-commentary'

  " Name: Rainbow
  " Description: Colorize brackets and parentheses
  Plug 'luochen1990/rainbow'

  " Name: vim-illuminate
  " Description: Highlight words matching the one under the cursor
  Plug 'RRethy/vim-illuminate'

  " Name: vim-search-pulse
  " Description: Pulse on scroll to the next search
  Plug 'inside/vim-search-pulse'

  " Name: ReplaceWithRegister
  " Description: allows to replace a given sentence with the chosen register
  Plug 'vim-scripts/ReplaceWithRegister'

  " Name: vim-textobj-user
  " Description: adds possibility to easly create text objects
  Plug 'kana/vim-textobj-user'
  Plug 'tek/vim-textobj-ruby'
  Plug 'bps/vim-textobj-python'
  Plug 'bps/vim-textobj-python'
  Plug 'kana/vim-textobj-datetime'
  Plug 'whatyouhide/vim-textobj-erb'
  Plug 'kana/vim-textobj-function'
  Plug 'kana/vim-textobj-line'
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
  " Name: vim-rails
  " Description: Support tool for rails projects
  Plug 'tpope/vim-rails'

  " Name: CSV.vim
  " Description: Better editing csv files
  Plug 'chrisbra/csv.vim'

  " Name: vim-javascript
  " Description: Better javascript syntax highlighting
  Plug 'pangloss/vim-javascript'

  " Name: vim-javascript
  " Description: Better jsx syntax highlighting
  Plug 'mxw/vim-jsx'

  " Name: markdown-preview.nvim
  " Description: Markdown preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  " Name: vim-snippets
  " Description: Snippets for vim
  Plug 'honza/vim-snippets'
  " }}}
call plug#end()

" Configuration {{{

" FZF.vim {{{
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
let g:NERDTreeShowHidden=0
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos='right'
" }}}

" Gruvbox {{{
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
" }}}

" UndoTree {{{
if has('persistent_undo')
    set undodir=~/.undodir/
    set undofile
endif
" }}}

" Neomake {{{
call neomake#configure#automake('nrwi', 500)
let g:neomake_tempfile_dir = '.vim/'
" }}}

" Far {{{
let g:far#source = 'ag'
let g:far#window_layout = 'tab'
let g:far#default_file_mask = './*'
let g:far#cwd = lib#ProjectRoot()
" }}}

" vim-airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#coc#enabled = 1
let g:airline_section_b = lib#GitBranchName()
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
autocmd CursorHold,CursorMoved,CursorHoldI,CursorMovedI * silent! call CocActionAsync('showSignatureHelp')
" }}}

" Rainbow {{{
let g:rainbow_active = 1
" }}}
" }}}
