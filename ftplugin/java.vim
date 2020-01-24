" Makers {{{
let g:neomake_java_enabled_makers = []
" }}}

" Functions {{{
function! JavaRunFileCommand() abort
  let file_name = expand('%')
  return 'javac "' . file_name . '" && java "' . substitute(file_name, '.java', '', '') . '"'
endfunction

function! JavaDebugFileCommand() abort
  let file_name = expand('%')
  return 'javac "' . file_name . '" && jdb "' . substitute(file_name, '.java', '', '') . '"'
endfunction
" }}}

" Mapping {{{
nnoremap <F8> :call lib#Run(JavaRunFileCommand())<CR>
nnoremap <F9> :call lib#Run(JavaDebugFileCommand())<CR>
" }}}
