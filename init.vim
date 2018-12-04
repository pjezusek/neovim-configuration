" Open configuration file
command! Oconf :execute 'tabnew $MYVIMRC'

" Reload configuration
command! Rconf :execute 'source $MYVIMRC'

" Open help in new tab 
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h' 

"Set <leader>
let mapleader = ','

let vimrc_dir = fnamemodify(expand('$MYVIMRC:p'), ':p:h')
let included_files = [
      \ 'general.vim',
      \ 'tabs.vim',
      \ 'mapping.vim',
      \ 'plugins.vim',
      \ 'status_line.vim'
      \	]

for file in included_files
  exec 'source ' . vimrc_dir . '/' . file
endfor
