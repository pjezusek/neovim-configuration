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

nnoremap <leader>f :find 
nnoremap <leader>sf :sfind 
nnoremap <leader>vf :vert sfind 
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

" Quickfix list {{{
nnoremap <leader>cw :cw<CR>
nnoremap <leader>cp :cp<CR>
nnoremap <leader>ccl :ccl<CR>
" }}}

" FZF {{{
nnoremap <C-P> :ProjectFiles<CR>
nnoremap <C-E> :Buffers<CR>
nnoremap <C-T> :Tags<CR>
nnoremap <C-S> :Ag<CR>
nnoremap <C-l> :BLines<CR>
nnoremap <C-F><C-t> :BTags<CR>
nnoremap <C-F><C-h> :History:<CR>
nnoremap <leader>se :Ag <c-r>=expand("<cword>")<CR><CR>
" }}}

" vim-multiple-cursor {{{
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<C-c>'
" }}}

" UndoTree {{{
nnoremap <leader>u :UndotreeToggle<CR>
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
xmap <leader>pr <Plug>(coc-format-selected)

nmap <leader>pr <Plug>(coc-format)

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
" }}}

" Ranger {{{
nnoremap <C-\> :RangerWorkingDirectory<CR>
nnoremap <leader>\ :Ranger<CR>
" }}}

