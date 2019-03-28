" Returns git root path if exists
"
" Return: String
function lib#FindGitRoot()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Returns git root path if exists or actual dir path
" It does not include '/' symbol at the end of path
"
" Return: String
function lib#FindProjectRoot()
  let git_root = lib#FindGitRoot()
  if git_root ==? ''
    return '.'
  else
    return git_root
  endif
endfunction

" Configure tab line design
"
" Return: String
function! lib#TabLineConfiguration()
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

" Configure tab label
"
" Return: String
function! lib#TabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr - 1])
  if name ==? ''
    let name = '[NEW]'
  endif
  return name
endfunction
