" Commands {{{
command! -nargs=* ReactComponentsFiles call lib#FzfInDir('/src/components')

command! -nargs=* ReactActionFiles call lib#FzfInDir('/src/actions')

command! -nargs=* ReactRoutersFiles call lib#FzfInDir('/src/routers')

command! -nargs=* ReactJSFiles call lib#FzfInDirWithExtensions('/', [ '.js', '.jsx' ])
command! -nargs=* ReactCSSFiles call lib#FzfInDirWithExtensions('/', [ '.scss', '.css', '.sass' ])
" }}}

" Mapping {{{
nnoremap <C-F><C-c> :ReactComponentsFiles<CR>
nnoremap <C-F><C-r> :ReactRoutersFiles<CR>
nnoremap <C-F><C-j> :ReactJSFiles<CR>
nnoremap <C-F><C-s> :ReactCSSFiles<CR>
" }}}


