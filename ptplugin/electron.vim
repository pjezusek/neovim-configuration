" General {{{
set nofoldenable
" }}}

" Makers {{{
let g:neomake_javascript_enabled_makers = []
" }}}

" Functions {{{
function! ElectronStartCommand() abort
  return 'npm start'
endfunction
" }}}

" Opts {{{
let opts = {
      \ 'docker': get(g:, 'electron_docker', 0),
      \ 'docker_image': get(g:, 'electron_docker_image', ''),
      \ 'docker_compose': get(g:, 'electron_docker_compose', 0),
      \ 'docker_service': get(g:, 'electron_docker_service', ''),
      \ 'sudo': get(g:, 'electron_sudo', 0),
\ }
" }}}

" Mapping {{{
nnoremap <F8> :call lib#Run(ElectronStartCommand(), opts)<CR>
nnoremap <leader>ap oconsole.log(``)<left><left>
nnoremap <leader>awp ywoprint(`<ESC>pa`)<left><left>
" }}}
