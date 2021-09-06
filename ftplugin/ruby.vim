" General {{{
set nofoldenable
" }}}

" Commands {{{
command! -nargs=0 RubyFormat call CocAction('format')
" }}}

" Mapping {{{
nnoremap <F9> korequire 'byebug'; byebug<esc>
nnoremap <F10> korequire 'pry'; binding.pry<esc>
nnoremap <leader>pr :RubyFormat<CR>
" }}}
