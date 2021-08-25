" Searches the given string in the whole project
command! -nargs=* Ag call lib#AgInProject(<q-args>)
" Searches the given string in the given dir
command! -nargs=* AgInDir call lib#AgInDir(<f-args>)

" let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" let g:fzf_buffers_jump = 1
" let g:fzf_tags_command = 'ag -l | ctags -L- -R -f .tags'
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
"
" nnoremap <C-P> :Files<CR>
" nnoremap <C-E> :Buffers<CR>
" nnoremap <C-T> :Tags<CR>
" nnoremap <C-S> :Ag<CR>
" nnoremap <C-F><C-l> :BLines<CR>
" nnoremap <C-F><C-t> :BTags<CR>
" nnoremap <leader>se :Ag <c-r>=expand("<cword>")<CR><CR>
" vnoremap <leader>se y:Ag <C-R><C-W><CR>
"
" command! -nargs=0 FZFComponents call lib#FzfInDir('components')
" command! -nargs=0 FZFPages call lib#FzfInDir('pages')
" command! -nargs=0 FZFApp call lib#FzfInDir('app')
" command! -nargs=0 FZFModels call lib#FzfInDir('app/models')
" command! -nargs=0 FZFControllers call lib#FzfInDir('app/controllers')
" command! -nargs=0 FZFSpec call lib#FzfInDir('spec')
" command! -nargs=0 FZFViews call lib#FzfInDir('app/views')
" command! -nargs=0 FZFFactories call lib#FzfInDir('spec/factories')
" nnoremap <C-f><C-c> :Files components<CR>
" nnoremap <C-f><C-p> :Files pages<CR>
" nnoremap <C-f><C-a> :Files app<CR>
" nnoremap <C-f><C-m> :Files app/models<CR>
" nnoremap <C-f><C-r> :Files app/controllers<CR>
" nnoremap <C-f><C-s> :Files spec<CR>
" nnoremap <C-f><C-v> :Files views<CR>
" nnoremap <C-f><C-f> :Files spec/factories<CR>
"
