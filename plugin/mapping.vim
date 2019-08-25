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

" Coc {{{
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Remap for rename current word
nnoremap <leader>r <Plug>(coc-rename)

" Diagnostic messages
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Go to
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" }}}
