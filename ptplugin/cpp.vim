" Commands {{{
" Search model files in rails project
command! -nargs=* CppCodeFiles call lib#FzfInDirWithExtensions('/', ['cc', 'cpp'])

" Search controller files in rails project
command! -nargs=* CppHeaderFiles call lib#FzfInDirWithExtensions('/', ['h', 'hpp'])
" }}}

" Mapping {{{
nnoremap <C-F><C-c> :CppCodeFiles<CR>
nnoremap <C-F><C-h> :CppHeaderFiles<CR>
" }}}
