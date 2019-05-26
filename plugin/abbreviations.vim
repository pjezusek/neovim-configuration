" GENERAL "
"""""""""""
" Open help in new tab 
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h' 

" Ctags
cnoreabbrev <expr> ct getcmdtype() == ":" && getcmdline() == 'ct' ? 'silent NeomakeSh ctags -R -f .tags --exclude=@.gitignore' : 'ct'

" messages
cnoreabbrev <expr> msg getcmdtype() == ":" && getcmdline() == 'msg' ? 'messages' : 'msg'

" RUBY "
""""""""
" Ripper tags
cnoreabbrev <expr> rt getcmdtype() == ":" && getcmdline() == 'rt' ? 'silent NeomakeSh ripper-tags -R -f .tags --exclude=@.gitignore' : 'rt' 

" Rubocop fix
cnoreabbrev <expr> rcf getcmdtype() == ":" && getcmdline() == 'rcf' ? 'silent !rubocop -a %' : 'rcf'

" JAVASCRIPT "
""""""""""""""
" ESLint fix
cnoreabbrev <expr> esf getcmdtype() == ":" && getcmdline() == 'esf' ? 'silent !eslint --fix %' : 'esf'

" js-beautify
cnoreabbrev <expr> jsb getcmdtype() == ":" && getcmdline() == 'jsb' ? 'silent !js-beautify -r -q -B %' : 'jsb'

" MAVEN "
"""""""""
" maven package
cnoreabbrev <expr> mvp getcmdtype() == ":" && getcmdline() == 'mvp' ? '!mvn package' : 'mvp'

" maven install
cnoreabbrev <expr> mvi getcmdtype() == ":" && getcmdline() == 'mvi' ? '!mvn install' : 'mvi'

" maven compile
cnoreabbrev <expr> mvc getcmdtype() == ":" && getcmdline() == 'mvc' ? '!mvn compile' : 'mvc'

" MAKEFILE "
""""""""""""
" makefile
cnoreabbrev <expr> mk getcmdtype() == ":" && getcmdline() == 'mk' ? '!make' : 'mk'

" OCTAVE "
""""""""""
" octave
cnoreabbrev <expr> oct getcmdtype() == ":" && getcmdline() == 'oct' ? '!octave %' : 'oct'
