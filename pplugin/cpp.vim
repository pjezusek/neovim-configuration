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

" Plugins options {{{
" Neomake {{{2
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
\ 'exe': 'clang++',
\ 'args': ['-Wall', '-Wextra', '-Isrc', '-fsyntax-only'],
\ }
"}}}
" }}}
