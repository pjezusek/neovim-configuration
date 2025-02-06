local opts = { noremap = true, silent = true }

local telescope = require("telescope.builtin")

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Define diagnostic signs
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " "
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Start renaming in normal mode
local function rename_in_normal_mode()
  vim.lsp.buf.rename()
  vim.api.nvim_input('<ESC> 0')
end

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local function format()
    vim.lsp.buf.format { async = true }
  end

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', telescope.lsp_definitions, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'rn', rename_in_normal_mode, bufopts)
  vim.keymap.set('n', '<A-a>', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', format, bufopts)
  vim.keymap.set('n', '<S-k>', vim.lsp.buf.signature_help, bufopts)
  require 'illuminate'.on_attach(client)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.diagnostic.config({
  signs = true,
  float = { border = "single" },
})

-- Solargraph
require 'lspconfig'.solargraph.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  cmd = { "bundle", "exec", "bin/solargraph", "stdio" }
}

-- Lua ls
require 'lspconfig'.lua_ls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'use' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Yamlls
require 'lspconfig'.yamlls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    yaml = {
      keyOrdering = false
    }
  }
}

-- Volar
require 'lspconfig'.volar.setup {
  filetypes = {
    'vue'
  },
  settings = {
    typescript = {
      preferences = {
        importModuleSpecifier = "non-relative"
      }
    }
  },
  on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    on_attach(client, bufnr)
    vim.keymap.set('n', '<space>f', ':EslintFixAll<CR>', bufopts)
  end,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- ts_ls
require 'lspconfig'.ts_ls.setup {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "non-relative"
    },
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

-- Eslint
require 'lspconfig'.eslint.setup {
  on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    on_attach(client, bufnr)
    vim.keymap.set('n', '<space>f', ':EslintFixAll<CR>', bufopts)
  end,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- cssls
require 'lspconfig'.cssls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- Pyright
require 'lspconfig'.pyright.setup {
  on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    on_attach(client, bufnr)
    vim.keymap.set('n', '<space>f', ':Black<CR>', bufopts)
  end,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- ltex
require 'lspconfig'.ltex.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    local home_dir = os.getenv('HOME')

    require('ltex_extra').setup {
      load_langs = { 'en-US', 'pl-PL' },
      init_check = true,
      path = home_dir .. '/.nvim/dictionaries',
      log_level = "none",
    }
  end,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    ltex = {
      language = 'en-US'
    }
  }
}

-- bashls
require 'lspconfig'.bashls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- dockerls
require 'lspconfig'.dockerls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- phpactor
require 'lspconfig'.phpactor.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- rust_analyzer
require 'lspconfig'.rust_analyzer.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- fish-lsp
require 'lspconfig'.fish_lsp.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- jsonls
require 'lspconfig'.jsonls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
