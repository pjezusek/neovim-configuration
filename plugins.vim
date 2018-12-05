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
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

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

" Multiple cursor configuration
let g:multi_cursor_use_default_mapping=0
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
\ 'ruby': ['buffer', 'around', 'tag', 'ultisnips'],
\ 'python3': ['buffer', 'around', 'tag', 'ultisnips'],
\ 'javascript': ['buffer', 'around', 'tag', 'ultisnips'],
\ 'vim': ['buffer', 'around', 'tag', 'ultisnips']
\})
let deoplete#tag#cache_limit_size = 5000000
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Neomake configuration
call neomake#configure#automake('nrwi', 500)

" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<A-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
