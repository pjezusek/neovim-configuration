" General {{{
set nofoldenable
" }}}

" Commands {{{
command! -nargs=0 Format :CocCommand prettier.formatFile
" }}}

" Mapping {{{
nnoremap <leader>pr :Format<CR>
" }}}
