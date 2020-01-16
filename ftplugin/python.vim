" Makers {{{
let g:neomake_python_enabled_makers = []
" }}}

" Functions {{{
function! PythonRunFileCommand() abort
  return 'PYTHONPATH="' . $PYTHONPATH . ':' . lib#GitRoot()  . '" python ' . expand('%')
endfunction
" }}}

" Opts {{{
let opts = {
      \ 'docker': get(g:, 'python_docker', 0),
      \ 'docker_image': get(g:, 'python_docker_image', ''),
      \ 'docker_compose': get(g:, 'python_docker_compose', 0),
      \ 'docker_service': get(g:, 'python_docker_service', ''),
      \ 'sudo': get(g:, 'python_sudo', 0),
\ }
" }}}

" Mapping {{{
nnoremap <F8> :call lib#Run(PythonRunFileCommand(), opts)<CR>
nnoremap <F9> koimport pdb; pdb.set_trace()<esc>
nnoremap <F10> koimport pudb; pu.db<esc>
nnoremap <leader>ap oprint(f"{}")<left><left><left>
nnoremap <leader>awp ywoprint(f"{<ESC>pa}")<left><left>
" }}}
