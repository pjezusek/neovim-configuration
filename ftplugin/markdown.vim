" Commands {{{
command! -nargs=0 MarkdownFormat :call CocAction('format')
" }}}

" Mapping {{{
nnoremap <leader>pr :MarkdownFormat<CR>
" }}}

