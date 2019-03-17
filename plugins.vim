" Autoinstall vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  " FZF
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " NERDTree
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin' 

  " Easymotion
  Plug 'easymotion/vim-easymotion'

  " Gruvbox
  Plug 'morhetz/gruvbox'

  " Fugitive
  Plug 'tpope/vim-fugitive'

  " Multiple cursors
  Plug 'terryma/vim-multiple-cursors'

  " UndoTree
  Plug 'mbbill/undotree'

  " Deoplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Surround
  Plug 'tpope/vim-surround'

  " Neomake
  Plug 'neomake/neomake'

  " Ultisnips
  Plug 'SirVer/ultisnips'

  " Snippets
  Plug 'honza/vim-snippets'

  " Far
  Plug 'brooth/far.vim'

  " LanguageClient
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

  " Echodoc
  Plug 'Shougo/echodoc.vim'

  " Vim rails
  Plug 'tpope/vim-rails'

call plug#end()

" FZF configuration
let g:fzf_layout = { 'down': '~50%' }
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 extend({'dir': s:find_git_root()},
  \                         fzf#vim#with_preview('right:60%'))
  \                )

command! -nargs=* ProjectFiles
  \ call fzf#vim#files(<q-args>,
  \                 extend({'dir': s:find_git_root()},
  \                         fzf#vim#with_preview('right:60%'))
  \                )

" Hide status line if fzf is on
augroup fzf
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup end

nnoremap <C-P> :ProjectFiles<CR>
nnoremap <C-E> :Buffers<CR>
nnoremap <C-T> :Tags<CR>
nnoremap <C-S> :Ag<CR>
nnoremap <C-F> :BLines<CR>
nnoremap <C-H> :History:<CR>
nnoremap <silent><leader>gf :GFiles?<CR>
nnoremap <silent><leader>gc :Commits<CR>
nnoremap <silent><leader>gbc :BCommits<CR>

" NERDTree configuration
let g:NERDTreeWinSize=40
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1
function! ToggleNERDTree()
  if g:NERDTree.IsOpen()
    :NERDTreeToggle 
  else
    :NERDTreeFind
  endif
endfunction
nnoremap <C-\> :call ToggleNERDTree()<CR>
nnoremap <leader>\ :NERDTreeToggle<CR>

" Gruvbox configuration
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" Fugitive configuration
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gl :silent Glog<CR>:cw<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gd :Gdiff<CR>

" Multiple cursor configuration
let g:multi_cursor_use_default_mapping =  0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<C-c>'

" UndoTree configuration
nnoremap <leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Deoplete configuration
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ 'ruby': ['LanguageClient', 'buffer', 'around', 'tag', 'ultisnips'],
\ 'python3': ['buffer', 'around', 'tag', 'ultisnips'],
\ 'javascript': ['buffer', 'around', 'tag', 'ultisnips'],
\ 'vim': ['buffer', 'around', 'tag', 'ultisnips'],
\ 'c': ['LanguageClient', 'buffer', 'around', 'tag', 'ultisnips'],
\ 'sh': ['buffer', 'around', 'tag', 'ultisnips'],
\ 'arduino': ['buffer', 'around', 'tag', 'ultisnips'],
\ 'java': ['LanguageClient', 'buffer', 'around', 'tag', 'ultisnips']
\})

call deoplete#custom#source('ultisnips', 'min_pattern_length', 1)
let deoplete#tag#cache_limit_size = 5000000
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" fix problem with multicursor
function Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction

" Neomake configuration
call neomake#configure#automake('nrwi', 500)
let g:neomake_tempfile_dir = '/tmp/'

" Ultisnips configuration
let g:UltiSnipsExpandTrigger='<A-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" Far configuration
let g:far#source = 'ag'
let g:far#window_layout = 'tab'
let g:far#default_file_mask = './'
let g:far#cwd = s:find_git_root()

" LanguageClient configuration
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'java': ['/usr/local/bin/jdtls', '-data', getcwd()],
    \ 'ruby': [ 'solargraph', 'stdio' ],
    \ 'c': [ 'clangd' ],
		\ 'cpp': [ 'clangd' ]
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Echodoc configuration
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'
