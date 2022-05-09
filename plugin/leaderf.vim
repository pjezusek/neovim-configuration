" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0
let g:Lf_JumpToExistingWindow = 0
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewCode = 1
let g:Lf_PreviewInPopup = 1
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"

noremap <C-P> :<C-U><C-R>=printf("Leaderf file")<CR><CR>
vnoremap <C-P> y:Leaderf file --input <C-R>"<CR>
noremap <C-E> :<C-U><C-R>=printf("Leaderf jumps")<CR><CR>
noremap <C-S> :<C-U><C-R>=printf("Leaderf rg")<CR><CR>
vnoremap <C-S> y:Leaderf rg --input <C-R>"<CR>
noremap <C-T> :<C-U><C-R>=printf("Leaderf tag")<CR><CR>
noremap <C-E> :<C-U><C-R>=printf("LeaderfMruCwd")<CR><CR>
noremap <leader><C-S> :<C-U><C-R>=printf("Leaderf rg --recall")<CR><CR>
noremap <leader><C-p> :<C-U><C-R>=printf("Leaderf file --recall")<CR><CR>
noremap <leader><C-t> :<C-U><C-R>=printf("Leaderf tag --recall")<CR><CR>
noremap <C-F><C-l> :<C-U><C-R>=printf("Leaderf line")<CR><CR>
noremap <C-F><C-t> :<C-U><C-R>=printf("Leaderf bufTag")<CR><CR>
noremap <C-F><C-f> :<C-U><C-R>=printf("Leaderf function")<CR><CR>
noremap <C-F><C-s> :<C-U><C-R>=printf("Leaderf snippet")<CR><CR>
noremap <C-F><C-q> :<C-U><C-R>=printf("Leaderf quickfix")<CR><CR>
noremap <C-F><C-b> :<C-U><C-R>=printf("Leaderf buffer")<CR><CR>
noremap <C-F><C-g> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
xnoremap <C-F><C-g> :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
noremap <C-F><C-r> :<C-U><C-R>=printf("Leaderf file --input %s", expand("%:t:r"))<CR><CR>

let g:Lf_PreviewResult = {
\ 'File': 1,
\ 'Buffer': 1,
\ 'Mru': 1,
\ 'Tag': 1,
\ 'BufTag': 1,
\ 'Function': 1,
\ 'Line': 1,
\ 'Colorscheme': 1,
\ 'Rg': 1,
\ 'Gtags': 1,
\ 'snippet': 1
\}
let g:Lf_CommandMap = {'<C-Up>': ['<C-p>'], '<C-Down>': ['<C-n>'], '<C-S>': ['<C-q>']}
