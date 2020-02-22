" Functions {{{
function! CmakeBuildCommand() abort
  let build_dir = get(g:, 'cmake_build_dir', 'build')
  return 'cd ' . build_dir . ' && cmake -DCMAKE_BUILD_TYPE=Debug  -fdebug-prefix-map=' . lib#ProjectRoot() . '/=. .. && make'
endfunction

function! CmakeCleanBuildCommand() abort
  let build_dir = get(g:, 'cmake_build_dir', 'build')
  return 'cd ' . build_dir . ' && cmake -DCMAKE_BUILD_TYPE=Debug -fdebug-prefix-map=' . lib#ProjectRoot() . '/=. .. && make clean && make'
endfunction

function! CmakeCleanBuildAndRunCommand() abort
  return CmakeCleanBuildCommand() . ' && make run'
endfunction

function! CmakeBuildAndRunCommand() abort
  return CmakeBuildCommand() . ' && make run'
endfunction
" }}}
"
" Mapping {{{
nnoremap <F6> :call lib#Run(CmakeBuildAndRunCommand())<CR>
nnoremap <F7> :call lib#Run(CmakeCleanBuildAndRunCommand())<CR>
" }}}

