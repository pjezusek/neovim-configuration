let vimrc_dir = fnamemodify(expand('$MYVIMRC:p'), ':p:h')
exec 'source ' . vimrc_dir . '/plugins.vim'
