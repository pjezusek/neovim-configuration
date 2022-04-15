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
  " Theme
  Plug 'morhetz/gruvbox'
  " Status bar
  Plug 'itchyny/lightline.vim'
  " Fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Fast editing surrounding characters
  Plug 'tpope/vim-surround'
  " Easy comments
  Plug 'tomtom/tcomment_vim'
  Plug 'tyru/caw.vim'
  " Colorize brackets and parentheses
  Plug 'luochen1990/rainbow'
  " Highlight words matching the one under the cursor
  Plug 'RRethy/vim-illuminate'
  "Pulse on scroll to the next search
  Plug 'inside/vim-search-pulse'
  " Allows to replace a given sentence with the chosen register
  Plug 'vim-scripts/ReplaceWithRegister'
  " Adds possibility to easly create text objects
  Plug 'kana/vim-textobj-user'
  Plug 'tek/vim-textobj-ruby'
  Plug 'bps/vim-textobj-python'
  " Use ranger in vim
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  " Client for language servers
  Plug 'neoclide/coc.nvim'
  " Working with variants of a word
  Plug 'tpope/vim-abolish'
  " Support tool for rails projects
  Plug 'tpope/vim-rails'
  " Syntax for javascript
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }
  " Snippets
  Plug 'honza/vim-snippets'
  " Track the engine.
  Plug 'SirVer/ultisnips'
  " Preview markdown files
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  " Seamlessly navigate vim and tmux
  Plug 'christoomey/vim-tmux-navigator'
  " Asynchronous Lint Engine
  Plug 'dense-analysis/ale'
  " Smart search
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
  Plug 'skywind3000/Leaderf-snippet'
  " Focus/Maximize/Minimize panels
  Plug 'Pocco81/TrueZen.nvim'
  " Syntax plugin for LaTeX files
  Plug 'lervag/vimtex'
  " Vim easymotion
  Plug 'easymotion/vim-easymotion'
  " Gutentags
  Plug 'ludovicchabant/vim-gutentags'
call plug#end()
