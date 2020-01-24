" Makers {{{
let g:neomake_python_enabled_makers = []
" }}}

" Functions {{{
function! PythonRunFileCommand() abort
  return 'PYTHONPATH="' . $PYTHONPATH . ':' . lib#GitRoot()  . '" python ' . expand('%')
endfunction

function! PythonOpts() abort
  let opts = {
        \ 'docker': get(g:, 'python_docker', 0),
        \ 'docker_image': get(g:, 'python_docker_image', ''),
        \ 'docker_compose': get(g:, 'python_docker_compose', 0),
        \ 'docker_compose_service': get(g:, 'python_docker_compose_service', ''),
        \ 'docker_compose_files': get(g:, 'python_docker_compose_files', ''),
        \ 'sudo': get(g:, 'python_sudo', 0),
  \ }
  return opts
endfunction
" }}}

" Mapping {{{
nnoremap <F8> :call lib#Run(PythonRunFileCommand(), PythonOpts())<CR>
nnoremap <F9> koimport pdb; pdb.set_trace()<esc>
nnoremap <F10> koimport pudb; pu.db<esc>
nnoremap <leader>ap oprint(f"{}")<left><left><left>
nnoremap <leader>awp ywoprint(f"{<ESC>pa}")<left><left>
" }}}
