" Commands {{{
" Search model files in rails project
command! -nargs=* CppCodeFiles call lib#FzfInDirWithExtensions('/', <q-args>, ['cc', 'cpp'])

" Search controller files in rails project
command! -nargs=* CppHeaderFiles call lib#FzfInDirWithExtensions('/', <q-args>, ['h', 'hpp'])
" }}}

" Mapping {{{
nnoremap <C-F><C-m> :CppCodeFiles<CR>
nnoremap <C-F><C-i> :CppHeaderFiles<CR>
" }}}
