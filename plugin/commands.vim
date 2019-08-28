" Opens configuration file
command! Oconf :execute 'tabnew $MYVIMRC'

" Reloads configuration
command! Rconf :execute 'source $MYVIMRC'

" Searches in whole project specific string
command! -nargs=* Ag call lib#AgInDir('', <q-args>)

" Searches files in whole project
command! -nargs=* ProjectFiles call lib#FzfInDir('')

" Opens NERDTree
command! NERDTreeLibToggle  call lib#NERDTreeToggle()

" Format buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile
