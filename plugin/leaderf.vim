" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewCode = 1
let g:Lf_PreviewInPopup = 1
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"

noremap <C-P> :<C-U><C-R>=printf("Leaderf file")<CR><CR>
noremap <C-E> :<C-U><C-R>=printf("Leaderf buffer")<CR><CR>
noremap <C-S> :<C-U><C-R>=printf("Leaderf rg")<CR><CR>
noremap <C-T> :<C-U><C-R>=printf("Leaderf gtags")<CR><CR>
noremap <C-F><C-l> :<C-U><C-R>=printf("Leaderf line")<CR><CR>
noremap <C-F><C-t> :<C-U><C-R>=printf("Leaderf bufTag")<CR><CR>
noremap <C-F><C-f> :<C-U><C-R>=printf("Leaderf function")<CR><CR>

noremap <leader>sg :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
xnoremap <leader>sg :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_GtagsAutoUpdate = 1
let g:Lf_Gtagslabel = 'pygments'
let g:Lf_Gtagsconf='/usr/share/gtags/gtags.conf'
let g:Lf_GtagsStoreInProject=1

let g:Lf_PreviewResult = {'Rg': 1, 'tag': 1, 'gtags': 1, 'function': 1, 'file': 1 }
let g:Lf_CommandMap = {'<C-Up>': ['<C-p>'], '<C-Down>': ['<C-n>']}

