" General {{{
set nofoldenable
" }}}

" Commands {{{
command! -nargs=0 VueFormat :CocCommand eslint.executeAutofix
" }}}

" Mapping {{{
nnoremap <leader>pr :VueFormat<CR>
" }}}
