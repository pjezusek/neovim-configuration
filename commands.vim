" GENERAL "
"""""""""""

" Open configuration file
command! Oconf :execute 'tabnew $MYVIMRC'

" Reload configuration
command! Rconf :execute 'source $MYVIMRC'

" Search in whole project specific string
command! -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 extend({'dir': lib#FindProjectRoot()},
  \                         fzf#vim#with_preview('up:40%'))
  \                )

" Search files in whole project
command! -nargs=* ProjectFiles
  \ call fzf#vim#files(lib#FindProjectRoot() . <q-args>,
  \                    fzf#vim#with_preview('right:55%'))

" Open NERDTree
command! NERDTreeLibToggle  call lib#NERDTreeToggle()

" RAILS "
"""""""""

" Search model files in rails project
command! -nargs=* RailsModelFiles
  \ call fzf#vim#files(lib#FindProjectRoot() . '/app/models' . <q-args>,
  \                    fzf#vim#with_preview('right:55%'))

" Search controller files in rails project
command! -nargs=* RailsControllerFiles
  \ call fzf#vim#files(lib#FindProjectRoot() . '/app/controllers' . <q-args>,
  \                    fzf#vim#with_preview('right:55%'))

" Search view files in rails project
command! -nargs=* RailsViewFiles
  \ call fzf#vim#files(lib#FindProjectRoot() . '/app/views' . <q-args>,
  \                    fzf#vim#with_preview('right:55%'))
