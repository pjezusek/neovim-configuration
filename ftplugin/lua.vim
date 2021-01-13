" General {{{
set nofoldenable
" }}}

" Functions {{{
function! LuaFormatter() abort
  :silent execute '!lua-format -i ' . expand('%')
endfunction
" }}}

" Commands {{{
command! -nargs=0 LuaFormat call LuaFormatter() | :e!
" }}}

" Mapping {{{
nnoremap <leader>pr :LuaFormat<CR>
" }}}
