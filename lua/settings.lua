-- Check defaults of neovim

-- syntax is enabled
-- encoding is UTF-8
-- nocomapatible is enabled
-- filetype with indentaction is enabled
-- autoread is enabled
-- wildmenu is enabled
-- incsearch is enabled

vim.g.mapleader = ' ' -- Set leader char to space
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.cmdheight = 2 -- Size of command line
vim.opt.cursorline = true -- Cursor line
vim.opt.expandtab = true -- Transform <Tab> into spaces
vim.opt.grepprg = 'ag --nogroup --nocolor' -- Use Silver Searcher istead of system grep
vim.opt.ignorecase = true -- Ignorecase during searching
vim.opt.inccommand = 'split' -- ?
vim.opt.list = true -- Show trailing characters
vim.opt.listchars = "tab:> ,trail:~,nbsp:+" -- Set chars for trailing spaces
vim.opt.number = true -- Show number of the line
vim.opt.relativenumber = true -- Show relative numbers
vim.opt.scrolloff = 3 -- Always leave 3 lines between cursor and end/beginning of the screen
vim.opt.shiftwidth = 2 -- Number of spacess for each steb of autoindent
vim.opt.showmode = false -- Do not show current mode of neovim
vim.opt.signcolumn = 'yes' -- Always show signcolumn
vim.opt.smartcase = true -- Be smart in 'cases' during searching
vim.opt.splitbelow = true -- Put a window below the current one
vim.opt.splitright = true -- Put a window  right of the current one
vim.opt.tabstop = 2 -- Number of spaces that represents <Tab>
vim.opt.tags = '.tags' -- Name of the tags file
vim.opt.undofile = true -- Save history into the file
vim.opt.wrap = false -- Do not wrap text
vim.g.ftplugin_sql_omni_key = '<C-x>' -- fix omni key in sql files
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.g.ranger_map_keys = 0
vim.g.tmux_navigator_no_mappings = 1
