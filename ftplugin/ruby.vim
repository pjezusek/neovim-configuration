let docker_compose_command = get(g:, 'docker_compose_command', 'docker-compose')
" General {{{
set foldmethod=syntax
set foldnestmax=2
set foldlevel=1
" }}}
" Abbrevations {{{
" Rubocop fix
if exists('g:ruby_rubocop_docker') && &g:ruby_rubocop_docker
  let service = get(g:, 'ruby_rubocop_docker_service', 'web')
  let command = 'silent !' . docker_compose_command . ' exec -T ' . service . ' rubocop -a %'
  cnoreabbrev <expr> rcf getcmdtype() == ":" && getcmdline() == 'rcf' ? command : 'rcf'
else
  cnoreabbrev <expr> rcf getcmdtype() == ":" && getcmdline() == 'rcf' ? 'silent !rubocop -a %' : 'rcf'
endif
" }}}

" Makers {{{
if exists('g:ruby_rubocop_docker') && g:ruby_rubocop_docker == 1
  let service = get(g:, 'ruby_rubocop_docker_service', 'web')
  let g:neomake_ruby_rubocop_maker = neomake#makers#ft#ruby#rubocop()                                                                                                                                           
  let g:neomake_ruby_rubocop_exe = docker_compose_command                                                                                                                                                             
  let g:neomake_ruby_rubocop_args = ['exec', '-T', service, 'bundle', 'exec', 'rubocop', '--stdin', '%'] + neomake#makers#ft#ruby#rubocop().args                                                                  
  let g:neomake_ruby_rubocop_uses_stdin = 1                                                                                                                                                                     
  let g:neomake_ruby_rubocop_uses_filename = 1                                                                                                                                                                  
  let g:neomake_ruby_rubocop_append_file = 0 
endif
" }}}
