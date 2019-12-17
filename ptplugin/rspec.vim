let g:rspec_docker = get(g:, 'rspec_docker', 0)
let g:rspec_docker_compose = get(g:, 'rspec_docker_compose', 0)
let g:rspec_docker_image = get(g:, 'rspec_docker_image', '')
let g:rspec_docker_service = get(g:, 'rspec_docker_service', 'web')

function! RspecRunAsSudo() abort
  return system('groups | grep docker') == '' ? 1 : 0
endfunction

function! RspecWholeCommand() abort
  return 'rspec ' . expand("%")
endfunction

function! RspecLineCommand() abort
  return 'rspec ' . expand("%") . ':' . getcurpos()[1]
endfunction

let environment = 'RAILS_ENV=test'

if g:rspec_docker
  nnoremap <F4> :call lib#RunInTerminal(lib#RunInDockerImageCommand(RspecWholeCommand(), rspec_docker_image, environment), RspecRunAsSudo())<CR>
  nnoremap <F5> :call lib#RunInTerminal(lib#RunInDockerImageCommand(RspecLineCommand(), rspec_docker_image, environment), RspecRunAsSudo())<CR>
elseif g:rspec_docker_compose
  nnoremap <F4> :call lib#RunInTerminal(lib#RunInDockerComposeCommand(RspecWholeCommand(), rspec_docker_service, environment), RspecRunAsSudo())<CR>
  nnoremap <F5> :call lib#RunInTerminal(lib#RunInDockerComposeCommand(RspecLineCommand(), rspec_docker_service, environment), RspecRunAsSudo())<CR>
else
  nnoremap <F4> :call lib#RunInTerminal(RspecWholeCommand())<CR>
  nnoremap <F5> :call lib#RunInTerminal(RspecLineCommand())<CR>
endif

