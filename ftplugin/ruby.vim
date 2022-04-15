" General {{{
let g:gutentags_ctags_executable_ruby = 'ripper-tags'
let g:gutentags_ctags_extra_args = ['--ignore-unsupported-options', '--recursive']
" }}}

" Commands {{{
command! -nargs=0 RubyFormat call CocAction('format')
command! -nargs=0 RSpecFailedSpecs call v:lua.require'rspec'.RSpecFailedToQuickfixList(".rspec_status")
" }}}

" Mapping {{{
nnoremap <F9> korequire 'byebug'; byebug<esc>
nnoremap <F10> korequire 'pry'; binding.pry<esc>
nnoremap <leader>pr :RubyFormat<CR>
nnoremap <leader>fs :RSpecFailedSpecs<CR>
" }}}
