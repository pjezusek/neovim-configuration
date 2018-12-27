set statusline=\ %f
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=\ %{FugitiveStatusline()} 
set statusline+=%<
set statusline+=%=
set statusline+=%y
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']'} 
set statusline+=\ R[%l/%L][%p%%]\ C[%c/%{strwidth(getline('.'))}]\ V[%b,0x%B]\ 
