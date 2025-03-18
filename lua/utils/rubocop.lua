local M = {}

function M.get_diagnostics_for_range(start_line, end_line)
  local current_buf = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(current_buf)

  -- Filter diagnostics for the selected lines
  local selected_diagnostics = {}
  for _, diagnostic in ipairs(diagnostics) do
    local line = diagnostic.lnum + 1 -- Convert to 1-indexed
    if line >= start_line and line <= end_line then
      local code = diagnostic.code
      if code then
        selected_diagnostics[code] = true
      end
    end
  end

  return selected_diagnostics
end

function M.disable_rubocop_for_selection()
  -- Get the current buffer
  local current_buf = vim.api.nvim_get_current_buf()

  -- Get the visual selection range
  local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")

  -- Get diagnostics for the selected range
  local selected_diagnostics = M.get_diagnostics_for_range(start_line, end_line)

  -- Create the disable comments
  local disable_codes = {}
  for code, _ in pairs(selected_diagnostics) do
    table.insert(disable_codes, code)
  end

  if #disable_codes == 0 then
    vim.notify("No diagnostic errors found in selection", vim.log.levels.WARN)
    return
  end

  local disable_comment = "# rubocop:disable " .. table.concat(disable_codes, ", ")
  local enable_comment = "# rubocop:enable " .. table.concat(disable_codes, ", ")

  -- Insert comments around the selection
  vim.api.nvim_buf_set_lines(current_buf, start_line - 1, start_line - 1, false, { disable_comment })
  vim.api.nvim_buf_set_lines(current_buf, end_line + 1, end_line + 1, false, { enable_comment })

  vim.notify("Added rubocop disable comments for: " .. table.concat(disable_codes, ", "), vim.log.levels.INFO)
end

function M.disable_rubocop_for_current_line()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_line = vim.fn.line(".")

  local selected_diagnostics = M.get_diagnostics_for_range(current_line, current_line)

  -- Create the disable comments
  local disable_codes = {}
  for code, _ in pairs(selected_diagnostics) do
    table.insert(disable_codes, code)
  end

  if #disable_codes == 0 then
    vim.notify("No diagnostic errors found on current line", vim.log.levels.WARN)
    return
  end

  local disable_comment = "# rubocop:disable " .. table.concat(disable_codes, ", ")
  local enable_comment = "# rubocop:enable " .. table.concat(disable_codes, ", ")

  -- Insert comments around the current line
  vim.api.nvim_buf_set_lines(current_buf, current_line - 1, current_line - 1, false, { disable_comment })
  vim.api.nvim_buf_set_lines(current_buf, current_line + 1, current_line + 1, false, { enable_comment })

  vim.notify("Added rubocop disable comments for: " .. table.concat(disable_codes, ", "), vim.log.levels.INFO)
end

return M
