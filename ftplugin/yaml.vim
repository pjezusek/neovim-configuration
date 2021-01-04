" Commands {{{
command! -nargs=0 YamlFormat :call CocAction('format')
" }}}

" Mapping {{{
nnoremap <leader>pr :YamlFormat<CR>
" }}}
