" Functions {{{
function! PytestCommand() abort
  return 'pytest -s ' . expand('%')
endfunction

function! PytestWithDebuggerCommand() abort
  return 'pytest -s -x --pdb ' . expand('%')
endfunction

function! PytestOpts() abort
  let opts = {
        \ 'docker': get(g:, 'pytest_docker', 0),
        \ 'docker_image': get(g:, 'pytest_docker_image', ''),
        \ 'docker_compose': get(g:, 'pytest_docker_compose', 0),
        \ 'docker_compose_service': get(g:, 'pytest_docker_compose_service', ''),
        \ 'docker_compose_files': get(g:, 'pytest_docker_compose_files', []),
        \ 'docker_compose_options': get(g:, 'pytest_docker_compose_options', []),
        \ 'environment': get(g:, 'pytest_environment', 'PYTHONPATH=.'),
        \ 'sudo': get(g:, 'pytest_sudo', 0)
  \ }
  return opts
endfunction
" }}}

" Commands {{{
command! -nargs=* PytestFiles call lib#FzfInDir('tests')
" }}}

" Mapping {{{
nnoremap <C-F><C-s> :PytestFiles<CR>
nnoremap <F4> :call lib#Run(PytestCommand(), PytestOpts())<CR>
nnoremap <F5> :call lib#Run(PytestWithDebuggerCommand(), PytestOpts())<CR>
" }}}
