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
vnoremap <leader>sg y:Search <C-R>=escape(@",'/\')<CR>

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

" Search selected
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
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
"
" FZF {{{
nnoremap <C-P> :ProjectFiles<CR>
nnoremap <C-E> :Buffers<CR>
nnoremap <C-T> :Tags<CR>
nnoremap <C-S> :Ag<CR>
nnoremap <C-F><C-l> :BLines<CR>
nnoremap <C-F><C-t> :BTags<CR>
nnoremap <leader>se :Ag <c-r>=expand("<cword>")<CR><CR>
vnoremap <leader>se y:Ag <C-R><CR>
nnoremap <C-f><C-c> :FZFComponents<CR>
nnoremap <C-f><C-p> :FZFPages<CR>
nnoremap <C-f><C-a> :FZFApp<CR>
nnoremap <C-f><C-m> :FZFModels<CR>
nnoremap <C-f><C-r> :FZFControllers<CR>
nnoremap <C-f><C-s> :FZFSpec<CR>
nnoremap <C-f><C-v> :FZFViews<CR>
nnoremap <C-f><C-f> :FZFFactories<CR>
" }}}

" Ranger {{{
nnoremap <leader>\ :RangerWorkingDirectory<CR>
nnoremap <C-\> :Ranger<CR>
" }}}

" Terminal {{{
tnoremap <Esc> <C-\><C-n>
" }}}

" Snippets {{{
imap <C-l> <Plug>(coc-snippets-expand)
" }}}

" Coc {{{
" Use <C-J> and <C-K> to navigate the completion list:
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gl <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

nnoremap <leader>d :CocDiagnostics<CR>
nnoremap <leader>pr <Plug>(ale_fix)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" }}}
