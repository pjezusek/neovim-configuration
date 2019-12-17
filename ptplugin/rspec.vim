let g:rspec_docker = get(g:, 'rspec_docker', 0)
let g:rspec_docker_compose = get(g:, 'rspec_docker_compose', 0)
let g:rspec_docker_image = get(g:, 'rspec_docker_image', '')
let g:rspec_docker_service = get(g:, 'rspec_docker_service', 'web')

if g:rspec_docker == 1
  nnoremap <F5> :call lib#RunInDockerImage('RAILS_ENV=test rspec ' . expand('%'), g:rspec_docker_image)<CR>
  nnoremap <F6> :call lib#RunInDockerImage('RAILS_ENV=test rspec ' . expand('%') . ':' getcurpos(), g:rspec_docker_image)<CR>
  vnoremap <F6> :call lib#RunInDockerImage('RAILS_ENV=test rspec ' . expand('%') . ':' getpos("'<")[1] . ',' . getpos("'>")[1], g:rspec_docker_image)<CR>
elseif g:rspec_docker_compose == 1
  nnoremap <F5> :call lib#RunInDockerCompose('RAILS_ENV=test rspec ' . expand('%'), g:rspec_docker_service)<CR>
  nnoremap <F6> :call lib#RunInDockerImage('RAILS_ENV=test rspec ' . expand('%') . ':' getcurpos()[1], g:rspec_docker_service)<CR>
  vnoremap <F6> :call lib#RunInDockerImage('RAILS_ENV=test rspec ' . expand('%') . ':' getpos("'<")[1] . ',' . getpos("'>")[1], g:rspec_docker_service)<CR>
else
  nnoremap <F5> :call lib#RunInTerminal('rspec ' . expand('%'))<CR>
  nnoremap <F6> :call lib#RunInTerminal('rspec ' . expand('%') . ':' . getcurpos()[1])<CR>
  vnoremap <F6> :call lib#RunInTerminal('rspec ' . expand('%') . ':' . getpos("'<")[1] . ',' .  getpos("'>")[1])<CR>
endif

