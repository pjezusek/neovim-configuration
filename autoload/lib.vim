" Returns the git root path if exists
"
" Return: String
function! lib#GitRoot() abort
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Returns the git branch name
"
" Return: String
function! lib#GitBranchName() abort
  return system("git branch | grep '*' | cut -f2 -d' ' 2> /dev/null")[:-2]
endfunction

" Returns the git root path if exists or an actual dir path
" It does not include the '/' symbol at the end of the path
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

" Returns the configuration for the tab line design
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

  " after the last tab fill with TabLineFill and reset the tab page nr
  let s .= '%#TabLineFill#%T'

  return s
endfunction

" Returns a tab label
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

" Starts fzf in the given dir
" It supports font icons
function! lib#FzfInDir(dir, ...) abort
  let s:options = get(a:, 1, {})
  call fzf#vim#files(lib#ProjectRoot() . a:dir, extend(s:options, fzf#vim#with_preview('right:55%')))
endfunction

" Starts fzf in the given dir (searches files with the given extension)
function! lib#FzfInDirWithExtensions(dir, extensions) abort
  let joined_extensions = join(a:extensions, '|')
  let extensions_pattern = '.(' . joined_extensions . ')$'
  let source = "ag -g \'" . extensions_pattern . "\' " . lib#ProjectRoot() . a:dir
  call lib#FzfInDir(a:dir, { 'source': source })
endfunction

" Starts ag in the given dir
function! lib#AgInDir(dir, args) abort
  call fzf#vim#ag(a:args,
  \               extend({'dir': lib#ProjectRoot() . a:dir},
  \               fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:40%'))
  \               )
endfunction

" Returns project type names. They are received from the file defined by g:project_type_file (default project_types).
" The file with list of types is searched in g:workspace_config_dir (default .vim_workspace)
"
" Return: List<String>
function! lib#GetProjectTypes() abort
  let config_dir = get(g:, 'workspace_config_dir', '.vim_workspace')
  let file_name = get(g:, 'project_type_file', 'project_type')
  let path = lib#ProjectRoot() . '/' . config_dir . '/' . file_name
  if filereadable(path)
    return readfile(path)
  else
    return []
  endif
endfunction

" Loads files from ptplugin dir. The list of files to load is received from lib#GetProjectTypes
function! lib#LoadProjectTypeConfig() abort
  let config_files = lib#GetProjectTypes()
  for config_file in config_files
    let path = fnamemodify($MYVIMRC, ':p:h') . '/ptplugin/' . config_file . '.vim'
    if(filereadable(path))
      exec 'source ' . path
    endif
  endfor
endfunction

" Loads configuration files that are define in the actual workspace.
" They should be located in g:workspace_config_dir (default .vim_workspace).
function! lib#LoadWorkspaceConfig() abort
  let config_dir = get(g:, 'workspace_config_dir', '.vim_workspace')
  let path = lib#ProjectRoot() . '/' . config_dir
  for config_file in split(globpath(path, '*.vim'), '\n')
    if(filereadable(config_file))
      exec 'source ' . config_file
    endif
  endfor
endfunction
