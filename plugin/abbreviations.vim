" Open help in new tab
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

" Ctags
cnoreabbrev <expr> ct getcmdtype() == ":" && getcmdline() == 'ct' ? 'silent NeomakeSh ag -l \| ctags -L- -R -f .tags' : 'ct'

" Messages
cnoreabbrev <expr> msg getcmdtype() == ":" && getcmdline() == 'msg' ? 'messages' : 'msg'

" AgInDir
cnoreabbrev <expr> agd getcmdtype() == ":" && getcmdline() == 'agd' ? 'AgInDir ' : 'agd'
