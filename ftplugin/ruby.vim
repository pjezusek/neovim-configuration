" General {{{
set nofoldenable
" }}}

" Makers {{{
let g:neomake_ruby_enabled_makers = []
" }}}

" Mapping {{{
nnoremap <F9> korequire 'byebug'; byebug<esc>
nnoremap <F10> korequire 'pry'; binding.pry<esc>
" }}}
