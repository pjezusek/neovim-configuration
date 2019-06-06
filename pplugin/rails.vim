" Commands {{{
" Search model files in rails project
command! -nargs=* RailsModelFiles call lib#FzfInDir('/app/models', <q-args>)

" Search controller files in rails project
command! -nargs=* RailsControllerFiles call lib#FzfInDir('/app/controllers', <q-args>)

" Search view files in rails project
command! -nargs=* RailsViewFiles call lib#FzfInDir('/app/views', <q-args>)

" Search in spec files
command! -nargs=* RailsSpecFiles call lib#FzfInDir('/app/spec', <q-args>)
" }}}

" Mapping {{{
nnoremap <C-F><C-m> :RailsModelFiles<CR>
nnoremap <C-F><C-c> :RailsControllerFiles<CR>
nnoremap <C-F><C-v> :RailsViewFiles<CR>
nnoremap <C-F><C-s> :RailsSpecFiles<CR>
" }}}
