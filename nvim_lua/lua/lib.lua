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

return M
