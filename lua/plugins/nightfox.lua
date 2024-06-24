require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "italic",
      types = "italic,bold"
    }
  }
})

vim.cmd("colorscheme nordfox")
