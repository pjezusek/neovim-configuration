" General {{{
set nofoldenable
" }}}

" Commands {{{
command! -nargs=0 JsonFormat call CocAction('format') | :e!
" }}}

" Mapping {{{
nnoremap <leader>pr :JsonFormat<CR>
" }}}
