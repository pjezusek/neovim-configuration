local M = {}

M.default_options = { noremap = true, silent = true }

--- Map the given shortcuts to the command in the given mode
-- @param mode mode in which mapping should be performed
-- @param mapping shortcuts for the command
-- @param command command to perform
-- @param options additional options for mapping
M.map = function(mode, mapping, command, options)
  options = options or M.default_options
  vim.api.nvim_set_keymap(mode, mapping, command, options)
end

--- Map the given shortcuts to the command in the normal mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.nmap = function(mapping, command, options)
  M.map('n', mapping, command, options)
end

--- Map the given shortcuts to the command in the insert mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.imap = function(mapping, command, options)
  M.map('i', mapping, command, options)
end

--- Map the given shortcuts to the command in visual and select mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.vmap = function(mapping, command, options)
  M.map('v', mapping, command, options)
end

M.xmap = function(mapping, command, options)
  M.map('x', mapping, command, options)
end

--- Map the given shortcuts to the command in the select mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.smap = function(mapping, command, options)
  M.map('s', mapping, command, options)
end

--- Map the given shortcuts to the command in the command line mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.cmap = function(mapping, command, options)
  M.map('c', mapping, command, options)
end

--- Map the given shortcuts to the command in the operator-pending line mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.omap = function(mapping, command, options)
  M.map('o', mapping, command, options)
end

--- Map the given shortcuts to the command in insert, command line and Lang-Arg mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.lmap = function(mapping, command, options)
  M.map('l', mapping, command, options)
end

return M
