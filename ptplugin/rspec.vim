" Functions {{{
function! RspecWholeCommand() abort
  return 'rspec ' . expand('%')
endfunction

function! RspecLineCommand() abort
  return 'rspec ' . expand('%') . ':' . getcurpos()[1]
endfunction

function! RspecOpts() abort
  let opts = {
        \ 'docker': get(g:, 'rspec_docker', 0),
        \ 'docker_image': get(g:, 'rspec_docker_image', ''),
        \ 'docker_compose': get(g:, 'rspec_docker_compose', 0),
        \ 'docker_compose_service': get(g:, 'rspec_docker_compose_service', ''),
        \ 'docker_compose_files': get(g:, 'rspec_docker_compose_files', []),
        \ 'sudo': get(g:, 'rspec_sudo', 0),
        \ 'environment': 'RAILS_ENV=test',
  \ }
  return opts
endfunction
" }}}

" Commands {{{
command! -nargs=* RspecFiles call lib#FzfInDir('/spec')
" }}}

" Mapping {{{
nnoremap <C-F><C-s> :RspecFiles<CR>
nnoremap <F4> :call lib#Run(RspecWholeCommand(), RspecOpts())<CR>
nnoremap <F5> :call lib#Run(RspecLineCommand(), RspecOpts())<CR>
" }}}
