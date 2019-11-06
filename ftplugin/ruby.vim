" General {{{
set foldmethod=syntax
set foldnestmax=2
set foldlevel=1
" }}}

" Docker {{{
let docker_compose_args = get(g:, 'docker_compose_args', [])
" }}}

" Abbrevations {{{
" Rubocop fix
if exists('g:ruby_rubocop_docker') && g:ruby_rubocop_docker == 1
  let service = get(g:, 'ruby_rubocop_docker_service', 'web')
  let command = 'silent !docker-compose ' . join(docker_compose_args, ' ') . ' exec -T ' . service . ' rubocop -a %'
  cnoreabbrev <expr> rcf getcmdtype() == ":" && getcmdline() == 'rcf' ? command : 'rcf'
else
  cnoreabbrev <expr> rcf getcmdtype() == ":" && getcmdline() == 'rcf' ? 'silent !rubocop -a %' : 'rcf'
endif
" }}}

" Makers {{{
let g:neomake_ruby_enabled_makers = []
if exists('g:neomake_ruby_rubocop') && g:neomake_ruby_rubocop == 1
  let g:neomake_ruby_enabled_makers = add(g:neomake_ruby_enabled_makers, 'rubocop')
  if exists('g:ruby_rubocop_docker') && g:ruby_rubocop_docker == 1
    let service = get(g:, 'ruby_rubocop_docker_service', 'web')
    let g:neomake_ruby_rubocop_maker = neomake#makers#ft#ruby#rubocop()
    let g:neomake_ruby_rubocop_exe = 'docker-compose'
    let g:neomake_ruby_rubocop_args = docker_compose_args + ['exec', '-T', service, 'bundle', 'exec', 'rubocop', '--stdin', '%'] + neomake#makers#ft#ruby#rubocop().args
    let g:neomake_ruby_rubocop_uses_stdin = 1
    let g:neomake_ruby_rubocop_uses_filename = 1
    let g:neomake_ruby_rubocop_append_file = 0
    let g:neomake_ruby_rubocop_cwd = lib#ProjectRoot()
  else
    let g:neomake_ruby_rubocop_maker = neomake#makers#ft#ruby#rubocop()
  endif
endif
" }}}
