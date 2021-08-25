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

" Starts fzf in the given dir.
function! lib#FzfInDir(dir, ...) abort
  let s:options = get(a:, 1, {})
  call fzf#vim#files(
        \ lib#ProjectRoot() . '/' . a:dir,
        \ extend(s:options, fzf#vim#with_preview('right:55%'))
        \ )
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

" Finds and replaces all occurence of the given word. It uses the safe mode
" so you have to accept each change.
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

" Runs the given command in a new terminal. It gets a password from the user
" if sudo is needed.
function! lib#Run(cmd, ...) abort
  let opts = get(a:, 1, {})
  let sudo = get(opts, 'sudo', 0)
  let sudo_password = get(g:, 'sudo_password', '')

  if sudo == 1 && sudo_password ==? ''
    call inputsave()
    let g:sudo_password = input('Enter password: ')
    call inputrestore()
  endif

  call lib#RunInTerminal(environment . ' ' . a:cmd, sudo)
endfunction
