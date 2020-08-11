" General {{{
set nofoldenable
" }}}

" Makers {{{
let g:neomake_ruby_enabled_makers = []
" }}}

" Functions {{{
function! RubyRunFileCommand() abort
  return 'ruby "' . fnamemodify(expand('%'), ':~:.') . '"'
endfunction

function! RubyOpts() abort
  let opts = {
        \ 'docker': get(g:, 'ruby_docker', 0),
        \ 'docker_image': get(g:, 'ruby_docker_image', ''),
        \ 'docker_compose': get(g:, 'ruby_docker_compose', 0),
        \ 'docker_compose_service': get(g:, 'ruby_docker_compose_service', ''),
        \ 'docker_compose_files': get(g:, 'ruby_docker_compose_files', []),
        \ 'docker_compose_options': get(g:, 'ruby_docker_compose_options', []),
        \ 'sudo': get(g:, 'ruby_sudo', 0),
  \ }
  return opts
endfunction


" Mapping {{{
nnoremap <F8> :call lib#Run(RubyRunFileCommand(), RubyOpts())<CR>
nnoremap <F9> korequire 'byebug'; byebug<esc>
nnoremap <F10> korequire 'pry'; binding.pry<esc>
nnoremap <leader>ap oraise .inspect<left><left><left><left><left><left><left><left>
nnoremap <leader>awp oraise <ESC>pa.inspect<left><left><left><left><left><left><left><left>
" }}}
