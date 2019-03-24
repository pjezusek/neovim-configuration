" Ripper tags
cnoreabbrev <expr> rt getcmdtype() == ":" && getcmdline() == 'rt' ? 'silent NeomakeSh ripper-tags -R -f .tags --exclude=@.gitignore' : 'rt' 

" Ctags
cnoreabbrev <expr> ct getcmdtype() == ":" && getcmdline() == 'ct' ? 'silent NeomakeSh ctags -R -f .tags --exclude=@.gitignore' : 'ct'

" Rubocop fix
cnoreabbrev <expr> rcf getcmdtype() == ":" && getcmdline() == 'rcf' ? 'silent !rubocop -a %' : 'rcf'

" ESLint fix
cnoreabbrev <expr> esf getcmdtype() == ":" && getcmdline() == 'esf' ? 'silent !eslint --fix %' : 'esf'

" js-beautify
cnoreabbrev <expr> jsb getcmdtype() == ":" && getcmdline() == 'jsb' ? 'silent !js-beautify -r -q -B %' : 'jsb'

" maven package
cnoreabbrev <expr> mvp getcmdtype() == ":" && getcmdline() == 'mvp' ? '!mvn package' : 'mvp'

" maven install
cnoreabbrev <expr> mvi getcmdtype() == ":" && getcmdline() == 'mvi' ? '!mvn install' : 'mvi'

" maven compile
cnoreabbrev <expr> mvc getcmdtype() == ":" && getcmdline() == 'mvc' ? '!mvn compile' : 'mvc'

" makefile
cnoreabbrev <expr> mk getcmdtype() == ":" && getcmdline() == 'mk' ? '!make' : 'mk'

" messages
cnoreabbrev <expr> msg getcmdtype() == ":" && getcmdline() == 'msg' ? 'messages' : 'msg'

" octave
cnoreabbrev <expr> oct getcmdtype() == ":" && getcmdline() == 'oct' ? '!octave %' : 'oct'
