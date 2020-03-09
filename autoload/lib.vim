" Returns the git root path if it exists.
"
" Return: String
function! lib#GitRoot() abort
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Returns the git branch name.
"
" Return: String
function! lib#GitBranchName() abort
  return system("git branch | grep '*' | cut -f2 -d' ' 2> /dev/null")[:-2]
endfunction

" Returns the git root path if exists or an actual dir path.
" It does not include the '/' symbol at the end of the path.
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

" Returns the configuration for the tab line design.
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

" Returns a tab label.
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

" Starts fzf in the given dir.
function! lib#FzfInDir(dir, ...) abort
  let s:options = get(a:, 1, {})
  call fzf#vim#files(lib#ProjectRoot() . '/' . a:dir, extend(s:options, fzf#vim#with_preview('right:55%')))
endfunction

" Starts fzf in the given dir (searches files with the given extension).
function! lib#FzfInDirWithExtensions(dir, extensions) abort
  let joined_extensions = join(a:extensions, '|')
  let extensions_pattern = '.(' . joined_extensions . ')$'
  let safe_project_root = substitute(lib#ProjectRoot(), '/', '\\/', 'g')
  let source = "ag -g \'" . extensions_pattern . "\' " . lib#ProjectRoot() . a:dir
  let source = source . " | sed 's/" . safe_project_root . "//g'"
  let source = source . " | sed 's/^\\///g'"
  call lib#FzfInDir(a:dir, { 'source': source })
endfunction

" Starts ag in the given dir.
function! lib#AgInDir(...) abort
  let dir = get(a:, 1, '')
  let search_string = get(a:, 2, '')
  call fzf#vim#ag(search_string,
  \               extend({'dir': lib#ProjectRoot() . '/' . dir},
  \               fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:40%'))
  \               )
endfunction

" Starts ag in the project root.
function! lib#AgInProject(args) abort
  call fzf#vim#ag(a:args,
  \               extend({'dir': lib#ProjectRoot()},
  \               fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:40%'))
  \               )
endfunction

" Returns project type names. They are received from the
" file defined by g:project_type_file (default project_type).
" The file with list of types is searched in g:workspace_config_dir
" (default .vim_workspace).
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

" Loads files from ptplugin dir. The list of files to load
" is received from lib#GetProjectTypes.
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

" Finds and replaces all occurence of the given word. It uses the safe mode
" so you have accept each change.
function! lib#GlobalReplace(...) abort
  execute 'silent grep! ' .  a:1 . ' | copen | cfdo %s/' . a:1 . '/' . a:2 . '/cg'
endfunction

" Runs the given command in a terminal in a new tab.
"
" Return: String
function! lib#RunInTerminal(cmd, ...) abort
  let sudo = get(a:, 1, 0)
  let sudo_password = get(g:, 'sudo_password', '')
  if sudo
    let terminal = 'terminal sudo'
    execute 'tabnew | ' . terminal . ' ' . a:cmd
    sleep 100m
    call chansend(b:terminal_job_id, sudo_password . "\n")
  else
    let terminal = 'terminal'
    execute 'tabnew | ' . terminal . ' ' . a:cmd
  end
  startinsert
  echo a:cmd
endfunction

" Returns a string that allows to call the given command in a docker container
" which is created from the given image_name.
function! lib#RunInDockerImageCommand(cmd, image_name, ...) abort
  let opts = get(a:, 1, {})
  let environment = get(opts, 'environment', '')
  if environment != ''
    let environment = ' -e ' . environment
  endif
  return 'docker run --rm -it' . environment . ' ' . a:image_name . ' "' . a:cmd
endfunction

" Returns a string that allows to call the given command in the give docker container.
"
" Return: String
function! lib#RunInDockerContainerCommand(cmd, container_name, ...) abort
  let opts = get(a:, 1, {})
  let environment = get(opts, 'environment', '')
  if environment != ''
    let environment = ' -e ' . environment
  endif
  return 'docker exec' . environment . ' ' . a:container_name . ' ' . a:cmd
endfunction

" Returns a string that allows to call the given command in a docker container
" which is created from the given service used by docker compose.
"
" Return: String
function! lib#RunInDockerComposeCommand(cmd, service_name, ...) abort
  let opts = get(a:, 1, {})
  let environment = get(opts, 'environment', '')
  if environment != ''
    let environment = ' -e ' . environment
  endif
  let docker_compose_files = get(opts, 'docker_compose_files', [])
  if docker_compose_files != []
    let docker_compose_files = ' -f ' . join(docker_compose_files, ' -f ')
  else
    let docker_compose_files = ''
  endif
  return 'docker-compose' . docker_compose_files . environment . ' run --rm ' . a:service_name . ' ' . a:cmd
endfunction

" Runs the given command in a new terminal. It calls method in docker or
" simple in a terminal. The calling method depends on the given configuration.
function! lib#Run(cmd, ...) abort
  let opts = get(a:, 1, {})
  let docker = get(opts, 'docker', 0)
  let docker_image = get(opts, 'docker_image', '')
  let docker_compose = get(opts, 'docker_compose', 0)
  let docker_compose_service = get(opts, 'docker_compose_service', '')
  let docker_compose_files = get(opts, 'docker_compose_files', [])
  let sudo = get(opts, 'sudo', 0)
  let sudo_password = get(g:, 'sudo_password', '')
  let environment = get(opts, 'environment', '')

  if sudo == 1 && sudo_password ==? ''
    call inputsave()
    let g:sudo_password = input('Enter sudo password: ')
    call inputrestore()
  endif


  if docker
    call lib#RunInTerminal(
    \ lib#RunInDockerImageCommand(
    \   a:cmd,
    \   docker_image,
    \   {
    \     'environment': environment,
    \   }
    \ ),
    \ sudo
    \)
  elseif docker_compose
    call lib#RunInTerminal(
    \ lib#RunInDockerComposeCommand(
    \   a:cmd,
    \   docker_compose_service,
    \   {
    \     'environment': environment,
    \     'docker_compose_files': docker_compose_files
    \   }
    \ ),
    \ sudo
    \)
  else
    call lib#RunInTerminal(environment . ' ' . a:cmd, sudo)
  endif
endfunction

" Creates a scratch file in <project_root>/.vim_workspace/scratch_files with
" the given extension.
function! lib#NewScratchFile(...) abort
  let config_dir = get(g:, 'workspace_config_dir', '.vim_workspace')
  let extension = get(a:, 1, expand('%:e'))
  let scratch_files_dir = lib#ProjectRoot() . '/' . config_dir . '/scratch_files'
  call system('mkdir -p ' . scratch_files_dir)
  let date = system("date '+%Y%m%d_%H%M%S." . extension . "'")
  let file_name = 'scratch_' . date
  call system('touch ' . scratch_files_dir . '/' . file_name)
  execute 'tabnew ' . scratch_files_dir . '/' . file_name
endfunction
