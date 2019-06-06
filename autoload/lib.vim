" Returns git root path if exists
"
" Return: String
function! lib#GitRoot() abort
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Returns git root path if exists or actual dir path
" It does not include '/' symbol at the end of path
"
" Return: String
function! lib#ProjectRoot() abort
  let git_root = lib#GitRoot()
  if git_root ==? ''
    return '.'
  else
    return git_root
  endif
endfunction

" Returns configuration for tab line design
"
" Return: String
function! lib#TabLineConfiguration() abort
  let s = ''
  for i in range(tabpagenr('$'))
    let buffers = tabpagebuflist(i + 1)
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= (i + 1) . ')'
    if len(buffers) > 1
      let s.= '{' . len(buffers) . '} '
    else
      let s.= ' '
    endif

    let s .= '%{lib#TabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  return s
endfunction

" Returns tab label
"
" Return: String
function! lib#TabLabel(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr - 1])
  if name ==? ''
    let name = '[NEW]'
  endif
  return name
endfunction

" Toggles NERDTree
function! lib#NERDTreeToggle() abort
  if g:NERDTree.IsOpen()
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction

" Starts fzf in given dir
function! lib#FzfInDir(dir, args) abort
  call fzf#vim#files(lib#ProjectRoot() . a:dir . a:args, fzf#vim#with_preview('right:55%'))
endfunction

" Starts fzf in given dir (searches files with given extension)
function! lib#FzfInDirWithExtensions(dir, args, extensions) abort
  let joined_extensions = join(a:extensions, '|')
  let extensions_pattern = '.(' . joined_extensions . ')$'
  let source = "ag -g \'" . extensions_pattern . "\' " . lib#ProjectRoot() . a:dir
  call fzf#vim#files(lib#ProjectRoot() . a:dir . a:args,
        \            extend({'source': source},
        \            fzf#vim#with_preview('right:55%'))
        \           )
endfunction

" Starts ag in given dir
function! lib#AgInDir(dir, args) abort
  call fzf#vim#ag(a:args,
  \               extend({'dir': lib#ProjectRoot() . a:dir},
  \               fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:40%'))
  \               )
endfunction

" Returns project type names
"
" Return: List<String>
function! lib#GetProjectTypes() abort
  let file_name = get(g:, 'project_type_file', '.project_type')
  let path = lib#ProjectRoot() . '/' . file_name
  if filereadable(path)
    return readfile(path)
  else
    return []
  endif
endfunction

" Loads configuration files that are defined by type names in g:project_type_file
function! lib#LoadProjectConfig() abort
  let config_files = lib#GetProjectTypes()
  for config_file in config_files
    let path = fnamemodify($MYVIMRC, ':p:h') . '/pplugin/' . config_file . '.vim'
    if(filereadable(path))
      exec 'source ' . path
    endif
  endfor
endfunction
