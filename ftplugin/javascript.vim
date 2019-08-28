let docker_compose_args = get(g:, 'docker_compose_args', [])
" General {{{
  set foldmethod=syntax
  set foldnestmax=2
  set foldlevel=1
" }}}

" Abbrevations {{{
" ESLint fix
if exists('g:javascript_eslint_docker') && g:javascript_eslint_docker == 1
  let service = get(g:, 'javascript_eslint_docker_service', 'web')
  let eslint_command = 'silent !docker-compose ' . join(docker_compose_args, ' ') . ' exec -T ' . service . ' ./node_modules/eslint/bin/eslint.js --fix %'
  cnoreabbrev <expr> esf getcmdtype() == ":" && getcmdline() == 'esf' ? eslint_command : 'esf'
else
  cnoreabbrev <expr> esf getcmdtype() == ":" && getcmdline() == 'esf' ? 'silent !' . lib#ProjectRoot() . '/node_modules/.bin/eslint --fix %' : 'esf'
endif

" js-beautify
if exists('g:javascript_js_beautify_docker') && g:javascript_js_beautify_docker == 1
  let service = get(g:, 'javascript_js_beautify_docker_service', 'web')
  let js_beautify_command = 'silent !docker-compose ' . join(docker_compose_args, ' ') . ' exec -T ' . service . ' ./node_modules/eslint/bin/js-beautify -r -q -B %'
  cnoreabbrev <expr> jsb getcmdtype() == ":" && getcmdline() == 'jsb' ? js_beautify_command : 'jsb'
else
  cnoreabbrev <expr> jsb getcmdtype() == ":" && getcmdline() == 'jsb' ? 'silent !' . lib#ProjectRoot() . '/node_modules/.bin/js-beautify -r -q -B %' : 'jsb'
endif
" }}}

" Makers {{{
if exists('g:javascript_eslint_docker') && g:javascript_eslint_docker == 1
  let service = get(g:, 'javascript_eslint_docker_service', 'web')
  let g:neomake_javascript_eslint_maker = neomake#makers#ft#javascript#eslint()
  let g:neomake_javascript_eslint_exe = 'docker-compose'
  let g:neomake_javascript_eslint_args = docker_compose_args + ['exec', '-T', service, './node_modules/eslint/bin/eslint.js', '%'] + neomake#makers#ft#javascript#eslint().args
  let g:neomake_javascript_eslint_uses_stdin = 1
  let g:neomake_javascript_eslint_uses_filename = 1
  let g:neomake_javascript_eslint_append_file = 0
  let g:neomake_javascript_eslint_cwd = lib#ProjectRoot()
else
  let g:neomake_javascript_eslint_maker = neomake#makers#ft#javascript#eslint()
endif
" }}}
