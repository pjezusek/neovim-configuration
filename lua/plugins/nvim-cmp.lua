-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'

-- icons
local lspkind = require('lspkind')

if cmp == nil then
  return
end

cmp.setup {
  formatting = {
    format = lspkind.cmp_format(),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-J>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-K>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  },
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-J>'] = cmp.mapping(function()
      cmp.select_next_item()
    end, { 'c' }),
    ['<C-K>'] = cmp.mapping(function()
      cmp.select_prev_item()
    end, { 'c' }),
  }),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-J>'] = cmp.mapping(function()
      cmp.select_next_item()
    end, { 'c' }),
    ['<C-K>'] = cmp.mapping(function()
      cmp.select_prev_item()
    end, { 'c' }),
  }),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})
