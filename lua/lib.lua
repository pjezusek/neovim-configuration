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
M.nmap = function(mapping, command)
  M.map('n', mapping, command)
end

--- Map the given shortcuts to the command in the insert mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.imap = function(mapping, command)
  M.map('i', mapping, command)
end

--- Map the given shortcuts to the command in visual and select mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.vmap = function(mapping, command)
  M.map('v', mapping, command)
end

M.xmap = function(mapping, command)
  M.map('x', mapping, command)
end

--- Map the given shortcuts to the command in the select mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.smap = function(mapping, command)
  M.map('s', mapping, command)
end

--- Map the given shortcuts to the command in the command line mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.cmap = function(mapping, command)
  M.map('c', mapping, command)
end

M.omap = function(mapping, command)
  M.map('o', mapping, command)
end

--- Map the given shortcuts to the command in insert, command line and Lang-Arg mode
-- @param mapping shortcuts for the command
-- @param command command to perform
M.lmap = function(mapping, command)
  M.map('l', mapping, command)
end

return M
