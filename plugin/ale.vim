let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_floating_preview = 1
let g:ale_cursor_detail = 1
let g:ale_close_preview_on_insert = 1
let g:ale_floating_window_border = []
let g:ale_linters = {
\   'json': ['jq', 'jsonlint'],
\}
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_echo_msg_format = '[%linter%] [%severity%] [%code%] %s'
