" General {{{
set nofoldenable
" }}}

" Commands {{{
command! -nargs=0 VueFormat :CocCommand prettier.formatFile
" }}}

" Mapping {{{
nnoremap <leader>pr :VueFormat<CR>
" }}}
