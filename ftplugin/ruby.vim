" General {{{
set nofoldenable
" }}}

" Functions {{{
function! RubocopAutofix() abort
  :silent execute '!rubocop -a ' . expand('%')
  :silent execute '!rubocop -A ' . expand('%')
endfunction
" }}}

" Commands {{{
command! -nargs=0 Format call RubocopAutofix() | :e!
" }}}

" Mapping {{{
nnoremap <F9> korequire 'byebug'; byebug<esc>
nnoremap <F10> korequire 'pry'; binding.pry<esc>
nnoremap <leader>pr :Format<CR>
" }}}
