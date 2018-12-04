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

" Ripper-tags shortcut
nnoremap <silent> <leader>rt :NeomakeSh ripper-tags -R -f .tags --exclude=@.gitignore<CR>

" Ctags shortcut
nnoremap <silent> <leader>ct :NeomakeSh ctags -R -f .tags --exclude=@.gitignore<CR>

" Rubocop autocorrect
nnoremap <silent> <leader>rca :!rubocop -a %<CR>
