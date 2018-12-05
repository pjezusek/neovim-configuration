" Rippert tags
cnoreabbrev <expr> rt getcmdtype() == ":" && getcmdline() == 'rt' ? 'silent NeomakeSh ripper-tags -R -f .tags --exclude=@.gitignore' : 'rt' 

" Ctags
cnoreabbrev <expr> ct getcmdtype() == ":" && getcmdline() == 'ct' ? 'silent NeomakeSh ctags -R -f .tags --exclude=@.gitignore' : 'ct' 

" Rubocop fix
cnoreabbrev <expr> rca getcmdtype() == ":" && getcmdline() == 'rca' ? 'silent !rubocop -a %' : 'rca' 
