" General {{{
set nofoldenable
" }}}

" Makers {{{
let g:neomake_ruby_enabled_makers = []
" }}}

" Functions {{{
function! RubyRunFileCommand() abort
  return 'ruby ' . expand('%')
endfunction
" }}}

" Opts {{{
let opts = {
      \ 'docker': get(g:, 'ruby_docker', 0),
      \ 'docker_image': get(g:, 'ruby_docker_image', ''),
      \ 'docker_compose': get(g:, 'ruby_docker_compose', 0),
      \ 'docker_service': get(g:, 'ruby_docker_service', ''),
      \ 'sudo': get(g:, 'ruby_sudo', 0),
\ }
" }}}

" Mapping {{{
nnoremap <F8> :call lib#Run(RubyRunFileCommand(), opts)<CR>
nnoremap <F9> korequire 'byebug'; byebug<esc>
nnoremap <F10> korequire 'pry'; binding.pry<esc>
" }}}
