"Set <leader>
let mapleader = ','

" GENERAL "
"""""""""""
" Map C-c to ESC
nnoremap <C-c> <ESC>
inoremap <C-c> <ESC>
vnoremap <C-c> <ESC>
xnoremap <C-c> <ESC>
snoremap <C-c> <ESC>
cnoremap <C-c> <ESC>
onoremap <C-c> <ESC>

" Remap save and quit commands
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Remap <C-W>Q behaviour
nnoremap <C-W>q :bd<CR>

" Disable some default behaviour
nnoremap q: <Nop>

" TABS "
""""""""
" Jumping between tabs
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt

" Create new tab
nnoremap <leader>tn :tabnew<CR>

" Move tabs in tabsbar
nnoremap <leader>tmr :tabmove +1<CR>
nnoremap <leader>tml :tabmove -1<CR>

" PREVIEW "
"""""""""""
nnoremap <leader>pt <C-W>} 
vnoremap <leader>pt <C-W>} 
nnoremap <leader>pc :pc<CR>
vnoremap <leader>pc :pc<CR>

" FUZZY FINDER "
""""""""""""""""
nnoremap <C-P> :ProjectFiles<CR>
nnoremap <C-E> :Buffers<CR>
nnoremap <C-T> :Tags<CR>
nnoremap <C-S> :Ag<CR>
nnoremap <C-F>l :BLines<CR>
nnoremap <C-F>h :History:<CR>
nnoremap <C-F>m :RailsModelsFiles<CR>                                                                
nnoremap <C-F>c :RailsControllersFiles<CR>                                                           
nnoremap <C-F>v :RailsViewsFiles<CR> 


" FILES TREE MANAGER "
""""""""""""""""""""""
nnoremap <C-\> g:NERDTree.IsOpen() ? :NERDTreeToggle : NERDTreeFind<CR>
nnoremap <leader>\ :NERDTreeToggle<CR>

" GIT REPOSITORY "
""""""""""""""""""
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gl :silent Glog<CR>:cw<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>gbc :BCommits<CR>
nnoremap <leader>gf :GFiles?<CR>

" MULTIPLE CURSOR "
"""""""""""""""""""
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<C-c>'

" UNDO TREE "
"""""""""""""
nnoremap <leader>u :UndotreeToggle<CR>

" ULTISNIPS "
"""""""""""""
let g:UltiSnipsExpandTrigger='<A-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" LANGUAGE CLIENT "
"""""""""""""""""""
nnoremap <leader>ld :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

" TAGBAR "
""""""""""
nnoremap <leader>t :TagbarToggle<CR>
