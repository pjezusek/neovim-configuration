-- Check defaults of neovim

-- syntax is enabled
-- encoding is UTF-8
-- nocomapatible is enabled
-- filetype with indentaction is enabled
-- autoread is enabled
-- wildmenu is enabled
-- incsearch is enabled

local lib = require('lib')

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

-- Theme
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.g.colorscheme="onedark"

-- Map C-c to ESC
lib.nmap('<C-c>', '<ESC>')
lib.imap('<C-c>', '<ESC>')
lib.vmap('<C-c>', '<ESC>')
lib.xmap('<C-c>', '<ESC>')
lib.smap('<C-c>', '<ESC>')
lib.cmap('<C-c>', '<ESC>')
lib.omap('<C-c>', '<ESC>')
lib.lmap('<C-c>', '<ESC>')

-- Remap save and quit commands
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('Q', 'q', {})
lib.nmap('<C-W>q', ':bd<CR>')

-- Disable some default behaviour
lib.nmap('q:', '<Nop>')

-- Tabs
lib.nmap('<leader>1', '1gt')
lib.nmap('<leader>2', '2gt')
lib.nmap('<leader>3', '3gt')
lib.nmap('<leader>4', '4gt')
lib.nmap('<leader>5', '5gt')
lib.nmap('<leader>n', ':tabnew<CR>')

-- Quickfix lists
lib.nmap(']q', ':cnext<CR>')
lib.nmap('[q', ':cprevious<CR>')
-- Location lists
lib.nmap(']l', ':lnext<CR>')
lib.nmap('[l', ':lprevious<CR>')

-- Resizing
lib.nmap('<A-i>', ':vertical resize +2<CR>')
lib.nmap('<A-d>', ':vertical resize -2<CR>')
lib.nmap('<A-I>', ':resize +2<CR>')
lib.nmap('<A-D>', ':resize -2<CR>')

-- Search
lib.vmap('//', [[miy/\V<C-R>=escape(@",'/\')<CR><CR>`i]])
lib.vmap('g//', [[y:silent grep <C-R>=escape(@",'/\')<CR><CR>:TroubleToggle quickfix<CR>]])
lib.vmap('<leader>rn', [[miy/\V<C-R>=escape(@",'/\')<CR><CR>`icgn]])
-- Handled by hlslends
-- lib.nmap('*', [[:keepjumps normal! mi*`i<CR>]])

-- Close all buffers except actual
vim.api.nvim_create_user_command('BufOnly', 'silent! execute "%bd|e#|bd#"', {})
lib.nmap('<A-q>', ':BufOnly<CR>')

-- Abbrevations
-- Open help in new tab
vim.api.nvim_command([[
  cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
]])
-- Messages
vim.api.nvim_command([[
  cnoreabbrev <expr> msg getcmdtype() == ":" && getcmdline() == 'msg' ? 'messages' : 'msg'
]])
-- Search
vim.api.nvim_command([[
  cnoreabbrev <expr> sr getcmdtype() == ":" && getcmdline() == 'sr' ? 'silent grep ' : 'sr'
]])
