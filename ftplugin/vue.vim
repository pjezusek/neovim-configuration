" General {{{
set nofoldenable
let g:gutentags_ctags_extra_args = []
" }}}

" Commands {{{
command! -nargs=0 VueFormat call CocAction('format')
" }}}

" Mapping {{{
nnoremap <leader>pr :VueFormat<CR>
" }}}
