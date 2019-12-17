" Abbrevations {{{
" Ripper tags
cnoreabbrev <expr> rt getcmdtype() == ":" && getcmdline() == 'rt' ? 'silent NeomakeSh ripper-tags -R -f .tags --exclude=@.gitignore' : 'rt'
" }}}

