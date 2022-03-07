" Open help in new tab
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
" Ctags
cnoreabbrev <expr> ct getcmdtype() == ":" && getcmdline() == 'ct' ? 'silent !ag -l \| ctags -L- -R -f .tags' : 'ct'
" Messages
cnoreabbrev <expr> msg getcmdtype() == ":" && getcmdline() == 'msg' ? 'messages' : 'msg'
" Search
cnoreabbrev <expr> sr getcmdtype() == ":" && getcmdline() == 'sr' ? 'silent grep ' : 'sr'

