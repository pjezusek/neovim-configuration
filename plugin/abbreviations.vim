" Open help in new tab
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

" Ctags
cnoreabbrev <expr> ct getcmdtype() == ":" && getcmdline() == 'ct' ? 'silent NeomakeSh ag -l \| ctags --links=no -L- -R -f .tags' : 'ct'

" Messages
cnoreabbrev <expr> msg getcmdtype() == ":" && getcmdline() == 'msg' ? 'messages' : 'msg'
