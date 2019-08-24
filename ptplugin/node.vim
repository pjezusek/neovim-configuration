" Commands {{{
" Search model files in node project
command! -nargs=* NodeModelFiles call lib#FzfInDir('/models')

" Search routes files in node project
command! -nargs=* NodeRoutesFiles call lib#FzfInDir('/routes')

" Search service files in node project
command! -nargs=* NodeServicesFiles call lib#FzfInDir('/services')
" }}}

" Mapping {{{
nnoremap <C-F><C-m> :NodeModelFiles<CR>
nnoremap <C-F><C-r> :NodeRoutesFiles<CR>
nnoremap <C-F><C-s> :NodeServicesFiles<CR>
" }}}

