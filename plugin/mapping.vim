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
lnoremap <C-c> <ESC>

" Remap save and quit commands
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Disable some default behaviour
nnoremap q: <Nop>

nnoremap <leader>f :find 
nnoremap <leader>sf :sfind 
nnoremap <leader>vf :vert sfind 

nnoremap <leader>rw :%s/<c-r>=expand("<cword>")<CR>//g<Left><Left>
nnoremap <leader>re :%s/\<<c-r>=expand("<cword>")<CR>\>//g<Left><Left>
nnoremap <leader>rs :%s/<c-r>=expand("<cword>")<CR>//gc<Left><Left>
nnoremap <leader>rg :GlobalReplace <c-r>=expand("<cword>")<CR> 

vnoremap <leader>rw y:%s/<C-R>"//g<Left><Left>
vnoremap <leader>re y:%s/\<<C-R>"\>//g<Left><Left>
vnoremap <leader>rs y:%s/<C-R>"//gc<Left><Left>
vnoremap <leader>rg y:GlobalReplace <C-R>" 

nnoremap <leader>sg :Search <c-r>=expand("<cword>")<CR>
vnoremap <leader>sg :Search <C-R>"

" Resize widow
nnoremap <A-i> :vertical resize +2<CR>
nnoremap <A-d> :vertical resize -2<CR>
nnoremap <A-I> :resize +2<CR>
nnoremap <A-D> :resize -2<CR>

" Copy filename to clipboard
nnoremap <leader>fp :let @+=expand("%")<CR>
nnoremap <leader>fd :let @+=expand("%:h")<CR>

" Open lazygit
nnoremap <A-g> :OpenLazyGit<CR>
" }}}

" Tabs {{{
" Jumping between tabs
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt

" Create new tab
nnoremap <A-n> :tabnew<CR>

" Move tabs in tabsbar
nnoremap <leader>tmr :tabmove +1<CR>
nnoremap <leader>tml :tabmove -1<CR>
" }}}

" Quickfix list {{{
nnoremap <leader>qq :copen<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap gn :cnext<CR>
nnoremap gp :cprevious<CR>
" }}}

" Location list {{{
nnoremap <leader>ll :lopen<CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>gp :lprevious<CR>
nnoremap <leader>gn :lnext<CR>
" }}}

" FZF {{{
nnoremap <C-P> :ProjectFiles<CR>
nnoremap <C-E> :Buffers<CR>
nnoremap <C-T> :CocList tags<CR>
nnoremap <C-S> :Ag<CR>
nnoremap <C-l> :BLines<CR>
nnoremap <C-F><C-t> :BTags<CR>
nnoremap <leader>se :Ag <c-r>=expand("<cword>")<CR><CR>
vnoremap <leader>se y:Ag <C-R><CR>
" }}}

" vim-multiple-cursor {{{
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = ''
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
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap for format selected region
xmap <leader>pr <Plug>(coc-format-selected)
nmap <leader>pr <Plug>(coc-format)

" Diagnostic messages
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Go to
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gu <Plug>(coc-references)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Remap for rename current word
nnoremap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}

" Ranger {{{
nnoremap <leader>\ :RangerWorkingDirectory<CR>
nnoremap <C-\> :Ranger<CR>
" }}}

" Terminal {{{
tnoremap <Esc> <C-\><C-n>
" }}}

" Tagbar {{{
nnoremap <leader>t :TagbarToggle<CR>
" }}}
