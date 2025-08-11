local lspconfig = require('lspconfig')
local cmp = require('cmp')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Настраиваем capabilities, расширяя возможности LSP для cmp
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

cmp.setup({
  snippet = {
    expand = function(args)
      -- Здесь можно подключить сниппет плагин, например luasnip
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),            -- включить автодополнение Ctrl+Space
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter подтверждает выбор
    -- ['<Tab>'] = cmp.mapping.select_next_item(),
    -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- Источник из LSP для автодополнения по коду
    { name = "luasnip" },
    { name = 'buffer' },   -- Автодополнение из текущего буфера
  })
})

lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        -- ignore = {"*"},
        typeCheckingMode = "strict",
      }
    }
  }
})

lspconfig.ruff.setup({
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
})

-- Выввод ошибок в inline строку
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
