" makers {{{
let g:neomake_lua_enabled_makers = []
" }}}

" General {{{
set nofoldenable
" }}}

" Functions {{{
function! LuaRunFileCommand() abort
  return 'lua "' . expand('%') . '"'
endfunction

" Mapping {{{
nnoremap <F8> :call lib#Run(LuaRunFileCommand())<CR>
nnoremap <leader>pr :call LuaFormat()<CR>
" }}}
