local utils = require('utils.generic')

-- Map C-c to ESC
utils.nmap('<C-c>', '<ESC>')
utils.imap('<C-c>', '<ESC>')
utils.vmap('<C-c>', '<ESC>')
utils.xmap('<C-c>', '<ESC>')
utils.smap('<C-c>', '<ESC>')
utils.cmap('<C-c>', '<ESC>')
utils.omap('<C-c>', '<ESC>')
utils.lmap('<C-c>', '<ESC>')

-- Disable some default behaviour
utils.nmap('q:', '<Nop>')

-- Tabs
utils.nmap('<leader>1', '1gt')
utils.nmap('<leader>2', '2gt')
utils.nmap('<leader>3', '3gt')
utils.nmap('<leader>4', '4gt')
utils.nmap('<leader>5', '5gt')
utils.nmap('<leader>n', ':tabnew<CR>')
utils.nmap('<A-.>', 'gt')
utils.nmap('<A-,>', 'gT')

-- Close all buffers except actual
utils.nmap('<A-q>', ':BufOnly<CR>')

-- Quickfix lists
utils.nmap(']q', ':cnext<CR>')
utils.nmap('[q', ':cprevious<CR>')

-- Location lists
utils.nmap(']l', ':lnext<CR>')
utils.nmap('[l', ':lprevious<CR>')

-- Resizing
utils.nmap('<A-i>', ':vertical resize +2<CR>')
utils.nmap('<A-d>', ':vertical resize -2<CR>')
utils.nmap('<A-I>', ':resize +2<CR>')
utils.nmap('<A-D>', ':resize -2<CR>')

-- Search
utils.vmap('//', [[miy/\V<C-R>=escape(@",'/\')<CR><CR>`i]])
utils.vmap('g//', [[y:silent grep <C-R>=escape(@",'/\')<CR><CR>:TroubleToggle quickfix<CR>]])
utils.vmap('<leader>rn', [[miy/\V<C-R>=escape(@",'/\')<CR><CR>`icgn]])

-- Clear search highlight
utils.nmap('<Leader>l', ':noh<CR>')

-- Hop plugin
utils.nmap('<leader>w', "<cmd>HopWord<cr>")

-- Lua snip plugin
-- TODO: Change this to lua mapping
vim.api.nvim_command([[
  imap <silent><expr> <C-Space> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-Space>' 
]])

-- hlslens plugin
utils.nmap('n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
utils.nmap('N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
utils.nmap('*', [[:keepjumps normal! mi*`i<CR><Cmd>lua require('hlslens').start()<CR>]])
utils.nmap('#', [[#<Cmd>lua require('hlslens').start()<CR>]])
utils.nmap('g*', [[g*<Cmd>lua require('hlslens').start()<CR>]])
utils.nmap('g#', [[g#<Cmd>lua require('hlslens').start()<CR>]])

-- ranger plugin
utils.nmap('<leader>\\', ':RangerWorkingDirectory<CR>')
utils.nmap('<C-\\>', ':Ranger<CR>')

-- telescope plugin
utils.nmap(
  '<C-P>',
  "<cmd>lua require('telescope.builtin').find_files({ find_command = RIPGREP_FIND_FILES_COMMAND })<cr>"
)
utils.nmap('<leader><C-P>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
utils.nmap('<C-S>', "<cmd>lua require('telescope.builtin').live_grep({ glob_pattern = RIPGREP_LIVE_GREP_GLOB_PATTERN })<cr>")
utils.nmap('<leader><C-S>', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
utils.nmap('<C-E>', "<cmd>lua require('telescope.builtin').buffers()<cr>")
utils.nmap('<leader><C-T>', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
utils.nmap('gR', "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
utils.nmap('<leader>m', "<cmd>lua require('telescope.builtin').marks()<cr>")

-- trouble plugin
utils.nmap('<leader>q', ':Trouble qflist toggle<CR>')
utils.nmap("<leader>xd", ":Trouble diagnostics toggle<CR>")
utils.nmap(']t', ':lua require("trouble").next({skip_groups = true, jump = true})<CR>')
utils.nmap('[t', ':lua require("trouble").prev({skip_groups = true, jump = true})<CR>')

-- vim-tmux plugin
utils.nmap('<C-h>', ':TmuxNavigateLeft<CR>')
utils.nmap('<C-j>', ':TmuxNavigateDown<CR>')
utils.nmap('<C-k>', ':TmuxNavigateUp<CR>')
utils.nmap('<C-l>', ':TmuxNavigateRight<CR>')

-- start subvert on selected text
utils.vmap('<leader>s', 'y:%Subvert/<C-r>"//<Left>')
