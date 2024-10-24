require("mason").setup({
  ensure_installed = {
    "prettier",
    "luacheck"
  },
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "volar",
    "eslint",
    "cssls",
    "ltex",
    "bashls",
    "dockerls",
    "phpactor",
    "rust_analyzer",
    "jsonls",
    "yamlls",
  },
})
