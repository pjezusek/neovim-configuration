" General {{{
"Set <leader>
let mapleader = ','

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
" }}}

" Tabs {{{
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
" }}}

" Preview {{{
nnoremap <leader>pt <C-W>} 
vnoremap <leader>pt <C-W>} 
nnoremap <leader>pc :pc<CR>
vnoremap <leader>pc :pc<CR>
" }}}

" Fuzzy finder {{{
nnoremap <C-P> :ProjectFiles<CR>
nnoremap <C-E> :Buffers<CR>
nnoremap <C-T> :Tags<CR>
nnoremap <C-S> :Ag<CR>
nnoremap <C-M> :Marks<CR>
nnoremap <C-F><C-t> :BTags<CR>
nnoremap <C-F><C-l> :BLines<CR>
nnoremap <C-F><C-h> :History:<CR>
" }}}

" Files tree manager {{{
nnoremap <C-\> :NERDTreeLibToggle<CR>
nnoremap <leader>\ :NERDTreeToggle<CR>
" }}}

" Git repository {{{
nnoremap <leader>gs :Gtabedit :<CR>
nnoremap <leader>gl :silent Glog<CR>:cw<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>gbc :BCommits<CR>
nnoremap <leader>gf :GFiles?<CR>
" }}}

" Multiple cursor {{{
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<C-c>'
" }}}

" Undo tree {{{
nnoremap <leader>u :UndotreeToggle<CR>
" }}}

" Ultisnips {{{
let g:UltiSnipsExpandTrigger='<A-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
" }}}

" Language client {{{
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
"}}}

" Tagbar {{{
nnoremap <leader>t :TagbarToggle<CR>
" }}}

" Far {{{
nnoremap <leader>se :F <c-r>=expand("<cword>")<CR>
vnoremap <leader>se "gy <bar> :F <c-r>g
nnoremap <leader>sh :F <c-r>=expand("<cword>")<CR> %<CR>
vnoremap <leader>sh "gy <bar> :F <c-r>g %<CR>
nnoremap <leader>re :Far <c-r>=expand("<cword>")<CR>
vnoremap <leader>re "gy <bar> :Far <c-r>g
nnoremap <leader>rh :Far <c-r>=expand("<cword>")<CR>  %<Left><Left>
vnoremap <leader>rh "gy <bar> :Far <c-r>g  %<Left><Left>
nnoremap <leader>rr :Refar
" }}}

" Quickfix list {{{
nnoremap <leader>cw :cw<CR>
nnoremap <leader>cp :cp<CR>
nnoremap <leader>ccl :ccl<CR>
" }}}

" Neomake {{{
nnoremap <leader>nm :Neomake<CR>
" }}}
