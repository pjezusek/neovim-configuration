" Commands {{{
command! -nargs=0 PythonFormat :call CocAction('format')
" }}}

" Mapping {{{
nnoremap <leader>pr :PythonFormat<CR>
nnoremap <F10> koimport pudb; pu.db<esc>
" }}}
