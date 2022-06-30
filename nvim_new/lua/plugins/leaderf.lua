local lib = require('lib')

vim.g.Lf_DefaultExternalTool = 'rg' -- Set riggrep as search tool
vim.g.Lf_DefaultMode = 'NameOnly' -- Set 'NameOnly' as a default mode
vim.g.Lf_HideHelp = 1 -- Don't show the help in normal mode
vim.g.Lf_IgnoreCurrentBufferName = 1 -- Do not show actual buffer in the result
vim.g.Lf_JumpToExistingWindow = 0 -- Open duplicated window istead of search actual one
vim.g.Lf_PreviewCode = 1 -- Show preview
vim.g.Lf_PreviewInPopup = 1 -- Preview in popup
vim.g.Lf_ShowDevIcons = 1 -- Show icons
vim.g.Lf_UseCache = 0 -- Do not use cache
vim.g.Lf_UseMemoryCache = 0 -- Do not use cache
vim.g.Lf_WindowPosition = 'popup' -- Enable popup window
vim.g.Lf_PopupPreviewPosition = 'right' -- Set position of the preview
vim.g.Lf_PopupWidth = 0.45 -- Enable popup window


-- Mapping
vim.g.Lf_CommandMap = {
  ['<C-Up>'] = { '<C-p>' },
  ['<C-Down>'] = { '<C-n>' },
  ['<C-S>'] = { '<C-q>' }
}

-- Preview settings
vim.g.Lf_PreviewResult = {
  File = 1,
  Buffer = 1,
  Mru = 1,
  Tag = 1,
  BufTag = 1,
  Function = 1,
  Line = 1,
  Colorscheme = 1,
  Rg = 1,
  Gtags = 1,
  snippet = 1
}

-- Mapping for commands
lib.nmap('<C-P>', ':Leaderf file<CR>')
lib.nmap('<C-S>', ':Leaderf rg<CR>')
lib.nmap('<C-E>', ':Leaderf mru<CR>')
lib.nmap('<leader><C-P>', ':Leaderf file --recall<CR>')
lib.nmap('<leader><C-S>', ':Leaderf rg --recall<CR>')
