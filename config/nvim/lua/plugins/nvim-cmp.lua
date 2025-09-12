return {
  {
    'hrsh7th/nvim-cmp',
    event = "VeryLazy",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      "rafamadriz/friendly-snippets",
      'saadparwaiz1/cmp_luasnip',
      "onsails/lspkind.nvim",

    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      cmp.setup({
        completion = {
          keyword_length = 1,
          completeopt = "menu,noselect",
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = "luasnip" },
          { name = 'buffer',  keyword_length = 2 },
          { name = "path" },
          { name = "nvim_lua" },
          { name = "cmdline" },
        }),
        window = {
          completion = cmp.config.window.bordered({
            border = 'rounded',
          }),
          documentation = cmp.config.window.bordered({
            border = 'rounded',
          }),
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              path = "[Path]",
              latex_symbols = "[Latex]",
            })
          }),
        },
      })
    end,
  },
}
