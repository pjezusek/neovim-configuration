" GENERAL "
"""""""""""

" Open configuration file
command! Oconf :execute 'tabnew $MYVIMRC'

" Reload configuration
command! Rconf :execute 'source $MYVIMRC'

" Search in whole project specific string
command! -nargs=* Ag call lib#AgInDir('', <q-args>)

" Search files in whole project
command! -nargs=* ProjectFiles call lib#FzfInDir('', <q-args>)

" Open NERDTree
command! NERDTreeLibToggle  call lib#NERDTreeToggle()

" RAILS "
"""""""""

" Search model files in rails project
command! -nargs=* RailsModelFiles call lib#FzfInDir('/app/models', <q-args>)

" Search controller files in rails project
command! -nargs=* RailsControllerFiles call lib#FzfInDir('/app/controllers', <q-args>)

" Search view files in rails project
command! -nargs=* RailsViewFiles call lib#FzfInDir('/app/views', <q-args>)

" Search in spec files
command! -nargs=* RailsSpecFiles call lib#FzfInDir('/app/spec', <q-args>)
