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
  \                         fzf#vim#with_preview('down:40%'))                                     
  \                )                                                                               
                                                                                                    
" Search files in whole project
command! -nargs=* ProjectFiles                                                                     
  \ call fzf#vim#files(<q-args>,                                                                   
  \                 extend({'dir': lib#FindProjectRoot()},                                                 
  \                         fzf#vim#with_preview('right:55%'))                                     
  \                )                                                                               
                                                                                                   
" RAILS "
"""""""""

" Search model files in rails project
command! -nargs=* RailsModelsFiles                                                                      
  \ call fzf#vim#files(<q-args>,                                                                   
  \                 extend({'dir': lib#FindProjectRoot() . 'app/models'},                                                  
  \                         fzf#vim#with_preview('right:55%'))                                     
  \                )                                                                               
                                                                                                   
" Search controller files in rails project
command! -nargs=* RailsControllersFiles                                                                 
  \ call fzf#vim#files(<q-args>,                                                                   
  \                 extend({'dir': lib#FindProjectRoot() . 'app/controllers'},                                             
  \                         fzf#vim#with_preview('right:55%'))                                     
  \                )                                                                               
                                                                                                   
" Search view files in rails project
command! -nargs=* RailsViewsFiles                                                                       
  \ call fzf#vim#files(<q-args>,                                                                   
  \                 extend({'dir': lib#FindProjectRoot() . 'app/controllers'},                                                   
  \                         fzf#vim#with_preview('right:55%'))                                     
  \    
