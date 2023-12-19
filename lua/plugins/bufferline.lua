local bufferline = require('bufferline')
bufferline.setup {
  options = {
    mode = "tabs",
    separator_style = "slope",
    indicator = {
      style = 'underline'
    },
    numbers = "ordinal",
    enforce_regular_tabs = true,
    tab_size = 30
  }
}
