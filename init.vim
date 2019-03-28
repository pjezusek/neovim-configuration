let vimrc_dir = fnamemodify(expand('$MYVIMRC:p'), ':p:h')
let included_files = [
      \ 'general.vim',
      \ 'plugins.vim',
      \ 'status_line.vim',
      \ 'mapping.vim',
      \ 'commands.vim',
      \ 'abbreviations.vim',
      \	]

for file in included_files
  exec 'source ' . vimrc_dir . '/' . file
endfor
