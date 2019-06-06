" Abbrevations {{{
" ESLint fix
cnoreabbrev <expr> esf getcmdtype() == ":" && getcmdline() == 'esf' ? 'silent !eslint --fix %' : 'esf'

" js-beautify
cnoreabbrev <expr> jsb getcmdtype() == ":" && getcmdline() == 'jsb' ? 'silent !js-beautify -r -q -B %' : 'jsb'
" }}}
