" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
set ambiwidth=double

noremap <C-P> :<C-U><C-R>=printf("Leaderf file")<CR><CR>
noremap <C-E> :<C-U><C-R>=printf("Leaderf buffer")<CR><CR>
noremap <C-T> :<C-U><C-R>=printf("Leaderf tag")<CR><CR>
noremap <C-S> :<C-U><C-R>=printf("Leaderf rg")<CR><CR>
noremap <C-F><C-l> :<C-U><C-R>=printf("Leaderf line")<CR><CR>
noremap <C-F><C-t> :<C-U><C-R>=printf("Leaderf bufTag")<CR><CR>

noremap <leader>sg :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
xnoremap <leader>sg :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'


let g:Lf_PreviewResult = {'Rg': 1 }
