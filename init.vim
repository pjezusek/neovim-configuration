let vimrc_dir = fnamemodify(expand('$MYVIMRC:p'), ':p:h')
let included_files = ['plugins.vim']

for file in included_files
  exec 'source ' . vimrc_dir . '/' . file
endfor
