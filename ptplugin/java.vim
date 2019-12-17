" Abbrevations {{{
" maven package
cnoreabbrev <expr> mvp getcmdtype() == ":" && getcmdline() == 'mvp' ? '!mvn package' : 'mvp'

" maven install
cnoreabbrev <expr> mvi getcmdtype() == ":" && getcmdline() == 'mvi' ? '!mvn install' : 'mvi'

" maven compile
cnoreabbrev <expr> mvc getcmdtype() == ":" && getcmdline() == 'mvc' ? '!mvn compile' : 'mvc'
" }}}

