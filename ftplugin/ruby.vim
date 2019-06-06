" Abbrevations {{{
" Rubocop fix
cnoreabbrev <expr> rcf getcmdtype() == ":" && getcmdline() == 'rcf' ? 'silent !rubocop -a %' : 'rcf'
" }}}


