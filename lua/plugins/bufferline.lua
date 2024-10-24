require('bufferline').setup {
  options = {
    mode = "tabs",
    separator_style = "slant",
    indicator = {
      style = 'underline'
    },
    diagnostics = "nvim_lsp",
    numbers = "ordinal",
    enforce_regular_tabs = true,
    tab_size = 30
  }
}
