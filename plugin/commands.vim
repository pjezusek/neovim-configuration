" Opens configuration file
command! Oconf :execute 'tabnew $MYVIMRC'

" Reloads configuration
command! Rconf :execute 'source $MYVIMRC'

" Searches the given string in the whole project
command! -nargs=* Ag call lib#AgInProject(<q-args>)

" Searches the given string in the given dir
command! -nargs=* AgInDir call lib#AgInDir(<f-args>)

" Searches files in whole project
command! -nargs=* ProjectFiles call lib#FzfInDir('')

" Rename
command! -nargs=0 Rename :CocCommand document.renameCurrentWord

" Close all buffers
command! Bonly %bd

" Use ag to search in project
command! -nargs=1 Search :silent grep! <args> | :copen

" Replace in whole project
command! -nargs=* GlobalReplace call lib#GlobalReplace(<f-args>)

" Create new scratch file
command! -nargs=* NewScratch call lib#NewScratchFile(<f-args>)
