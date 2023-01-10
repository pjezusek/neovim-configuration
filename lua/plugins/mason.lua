require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "solargraph",
    "yamlls",
    "volar",
    "eslint",
    "cssls",
    "pyright",
    "ltex",
    "bashls",
    "dockerls",
    "cmake",
    "graphql",
    "html",
    "jsonls",
    "sqlls",
    "vimls",
    "lemminx"
  },
})
