" General {{{
set nofoldenable
" }}}

" Commands {{{
command! -nargs=0 TypescriptFormat :CocCommand prettier.formatFile
" }}}

" Mapping {{{
nnoremap <leader>pr :TypescriptFormat<CR>
" }}}
