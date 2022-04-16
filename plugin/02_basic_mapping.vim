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

nnoremap <leader>rw :%s/<c-r>=expand("<cword>")<CR>//g<Left><Left>
nnoremap <leader>re :%s/\<<c-r>=expand("<cword>")<CR>\>//g<Left><Left>
nnoremap <leader>rs :%s/<c-r>=expand("<cword>")<CR>//gc<Left><Left><Left>
nnoremap <leader>rg :GlobalReplace <c-r>=expand("<cword>")<CR>

vnoremap <leader>rw y:%s/<C-R>"//g<Left><Left>
vnoremap <leader>re y:%s/\<<C-R>"\>//g<Left><Left>
vnoremap <leader>rs y:%s/<C-R>"//gc<Left><Left>
command! -nargs=* GlobalReplace call lib#GlobalReplace(<f-args>)
vnoremap <leader>rg y:GlobalReplace <C-R>" 

" Resize widow
nnoremap <A-i> :vertical resize +2<CR>
nnoremap <A-d> :vertical resize -2<CR>
nnoremap <A-I> :resize +2<CR>
nnoremap <A-D> :resize -2<CR>

" Copy filename to clipboard
nnoremap <leader>cfp :let @+=expand("%")<CR>
nnoremap <leader>cfd :let @+=expand("%:h")<CR>

" Search
nnoremap <leader>gf :silent grep <c-r>=expand("<cword>")<CR><CR>:copen<CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap g// y:silent grep <C-R>=escape(@",'/\')<CR><CR>:copen<CR>

" Jumping between tabs
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt

" Create new tab
nnoremap <A-n> :tabnew<CR>

" Moving in quicklist
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Moving in locationlist
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
