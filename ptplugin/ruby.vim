" Abbrevations {{{
" Ripper tags
cnoreabbrev <expr> rt getcmdtype() == ":" && getcmdline() == 'rt' ? 'silent NeomakeSh ag -l \| ripper-tags --links=no -L- -R -f .tags' : 'rt'
" }}}

