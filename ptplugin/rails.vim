" Functions {{{
function! RailsRunFileCommand() abort
  return 'rails r  ' . expand('%')
endfunction
" }}}

" Opts {{{
let opts = {
      \ 'docker': get(g:, 'rails_docker', 0),
      \ 'docker_image': get(g:, 'rails_docker_image', ''),
      \ 'docker_compose': get(g:, 'rails_docker_compose', 0),
      \ 'docker_service': get(g:, 'rails_docker_service', ''),
      \ 'sudo': get(g:, 'rails_sudo', 0),
      \ 'environment': 'RAILS_ENV=development',
\ }
" }}}

" Commands {{{
" Search model files in rails project
command! -nargs=* RailsModelFiles call lib#FzfInDir('/app/models')

" Search controller files in rails project
command! -nargs=* RailsControllerFiles call lib#FzfInDir('/app/controllers')

" Search view files in rails project
command! -nargs=* RailsViewFiles call lib#FzfInDir('/app/views')
" }}}

" Mapping {{{
nnoremap <C-F><C-m> :RailsModelFiles<CR>
nnoremap <C-F><C-c> :RailsControllerFiles<CR>
nnoremap <C-F><C-v> :RailsViewFiles<CR>
nnoremap <F6> :call lib#Run(RailsRunFileCommand(), opts)<CR>
" }}}
