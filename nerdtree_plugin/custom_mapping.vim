call g:NERDTreeAddKeyMap({
       \ 'key': 'ff',
       \ 'callback': 'FarFindInDir',
       \ 'quickhelpText': 'find given string in selected dir using far',
       \ 'scope': 'DirNode' })

call g:NERDTreeAddKeyMap({
       \ 'key': 'fr',
       \ 'callback': 'FarReplaceInDir',
       \ 'quickhelpText': 'replace given string in selected dir using far',
       \ 'scope': 'DirNode' })

call g:NERDTreeAddKeyMap({
       \ 'key': 'as',
       \ 'callback': 'AgSearchInDir',
       \ 'quickhelpText': 'search in selected dir using ag',
       \ 'scope': 'DirNode' })

" Search in dir using Far
function! FarFindInDir(dirNode) abort
  call inputsave()
  let searched_string = input('Find: ')
  call inputrestore()
  let file_pattern = substitute(a:dirNode.path.str(), g:far#cwd, '', '') . '/.*'
  exe ':F ' . searched_string . ' ' . file_pattern
endfunction

" Search in dir using Far
function! FarReplaceInDir(dirNode) abort
  call inputsave()
  let searched_string = input('Find: ')
  let replace = input('Replace with: ')
  call inputrestore()
  let file_pattern = substitute(a:dirNode.path.str(), g:far#cwd, '', '') . '/.*'
  exe ':Far ' . searched_string . ' ' . replace . ' ' . file_pattern
endfunction

" Search in dir using Far
function! AgSearchInDir(dirNode) abort
  let relative_dir_path = substitute(a:dirNode.path.str(), lib#FindProjectRoot(), '', '')
  let full_path = lib#FindProjectRoot() . relative_dir_path
  call fzf#vim#ag('',
  \               extend({'dir': full_path },
  \               fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:40%'))
  \               )
endfunction
