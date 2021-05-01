" Searches the given string in the whole project
command! -nargs=* Ag call lib#AgInProject(<q-args>)

" Searches the given string in the given dir
command! -nargs=* AgInDir call lib#AgInDir(<f-args>)

" Searches files in whole project
command! -nargs=0 ProjectFiles call lib#FzfInDir('')

" Use ag to search in project
command! -nargs=1 Search :silent grep! <q-args> | :copen

" Replace in whole project
command! -nargs=* GlobalReplace call lib#GlobalReplace(<f-args>)

" Open actual file in browser
command! -nargs=0 OpenFileInBrowser execute ':OpenBrowser file:///' . expand('%:p')

" Open lazygit in terminal
command! -nargs=0 OpenLazyGit call lib#RunInTerminal('lazygit', 0)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

command! -nargs=0 FZFComponents call lib#FzfInDir('components')
command! -nargs=0 FZFPages call lib#FzfInDir('pages')
command! -nargs=0 FZFApp call lib#FzfInDir('app')
command! -nargs=0 FZFModels call lib#FzfInDir('app/models')
command! -nargs=0 FZFControllers call lib#FzfInDir('app/controllers')
command! -nargs=0 FZFSpec call lib#FzfInDir('spec')
command! -nargs=0 FZFViews call lib#FzfInDir('app/views')
command! -nargs=0 FZFFactories call lib#FzfInDir('spec/factories')
