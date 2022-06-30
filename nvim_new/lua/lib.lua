local M = {}

M.default_options = { noremap = true, silent = true }

M.map = function(mode, mapping, command, options)
  options = options or M.default_options
  vim.api.nvim_set_keymap(mode, mapping, command, options)
end

M.nmap = function(mapping, command)
  M.map('n', mapping, command)
end

M.imap = function(mapping, command)
  M.map('i', mapping, command)
end

M.vmap = function(mapping, command)
  M.map('v', mapping, command)
end

M.xmap = function(mapping, command)
  M.map('x', mapping, command)
end

M.smap = function(mapping, command)
  M.map('s', mapping, command)
end

M.cmap = function(mapping, command)
  M.map('c', mapping, command)
end

M.omap = function(mapping, command)
  M.map('o', mapping, command)
end

M.lmap = function(mapping, command)
  M.map('l', mapping, command)
end

return M
