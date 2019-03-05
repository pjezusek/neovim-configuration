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

" Add mapping for quickfix list
nnoremap <leader>cw :cw<CR>
nnoremap <leader>cc :ccl<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>lw :lw<CR>
nnoremap <leader>lc :lcl<CR>
nnoremap <leader>lp :lprev<CR>
nnoremap <leader>ln :lnext<CR>

" Remap <C-W>Q behaviour
nnoremap <C-W>q :bd<CR>

" Cursor column and row
nnoremap <leader>crc :set cursorcolumn!<CR>
nnoremap <leader>crl :set cursorline!<CR>

" Mapping grep
nnoremap <silent> <leader>s "gyiw<bar> :grep! <C-R>g<CR>:cw<CR>
vnoremap <silent> <leader>s "gy<bar> :grep! <C-R>g<CR>:cw<CR>
nnoremap <silent> <leader>rs :grep! <C-R>g<CR>:cw<CR>

" Preview options
nnoremap <leader>pt <C-W>} 
vnoremap <leader>pt <C-W>} 
nnoremap <leader>pc :pc<CR>
vnoremap <leader>pc :pc<CR>

" Disable some default behaviour
nnoremap q: <Nop>
