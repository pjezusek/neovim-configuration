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

  " Name: lightline
  " Description: Status bar
  Plug 'itchyny/lightline.vim'
  "}}}

  " Searching and movement {{{
  " Name: fzf.vim
  " Description: Fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " }}}

  " Editing {{{
  " Name: vim-surround
  " Description: Fast editing surrounding characters
  Plug 'tpope/vim-surround'

  " Name: tcomment_vim
  " Description: Easy comments
  Plug 'tomtom/tcomment_vim'
  Plug 'tyru/caw.vim'

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
  " Description: Adds possibility to easly create text objects
  Plug 'kana/vim-textobj-user'
  Plug 'tek/vim-textobj-ruby'
  Plug 'bps/vim-textobj-python'

  " Name: ranger.vim
  " Description: Use ranger in vim
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'

  " Name: Coc.nvim
  " Description: Client for language servers
  Plug 'neoclide/coc.nvim'
  " }}}

  " Languages support {{{
  " Name: vim-rails
  " Description: Support tool for rails projects
  Plug 'tpope/vim-rails'

  " Name: vim-javascript
  " Description: Syntax for javascript
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }

  " Name: vim-snippets
  " Description: Snippets
  Plug 'honza/vim-snippets'
  "}}}

  " Others {{{
  " Name: vim-tmux-navigator
  " Description: Seamlessly navigate vim and tmux
  Plug 'christoomey/vim-tmux-navigator'
  " }}}
call plug#end()

" Configuration {{{

" FZF {{{
let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
          \ 'bg':      ['bg', 'Normal'],
          \ 'hl':      ['fg', 'Comment'],
          \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
          \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
          \ 'hl+':     ['fg', 'Statement'],
          \ 'info':    ['fg', 'PreProc'],
          \ 'border':  ['fg', 'Ignore'],
          \ 'prompt':  ['fg', 'Conditional'],
          \ 'pointer': ['fg', 'Exception'],
          \ 'marker':  ['fg', 'Keyword'],
          \ 'spinner': ['fg', 'Label'],
          \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'down': '~50%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" Hide status line if fzf is on
augroup fzf
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler showtabline=0
    \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler showtabline=1
augroup end
" }}}

" Gruvbox {{{
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
" }}}

" Rainbow {{{
let g:rainbow_active = 1
" }}}

" Ranger {{{
let g:ranger_map_keys = 0
" }}}

" vim-tmux-navigator {{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" }}}

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ }
      \ }
" }}}

" Coc.nvim {{{
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" }}}
" }}}
