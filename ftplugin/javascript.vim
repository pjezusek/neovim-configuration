" General {{{
set nofoldenable
" }}}

" Commands {{{
command! -nargs=0 JavascriptFormat :CocCommand prettier.formatFile
" }}}

" Mapping {{{
nnoremap <leader>pr :JavascriptFormat<CR>
" }}}
