local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({select = true}),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp"},
    { name = "luasnip"},
    { name = "buffer"},
  }),
})

lspconfig.pyright.setup({})
lspconfig.ruff.setup({})


vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

require("conform").setup({
  formatters_by_ft = {
    python = { "ruff_format" },

  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

require("lint").linters_by_ft = {
  python = { "mypy", "ruff" },
}

-- vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)
--
-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--     callback = function(ev)
--         -- Enable completion triggered by <c-x><c-o>
--         vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--         local opts = {buffer = ev.buf}
--         vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--         vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--         vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--         vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--         vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
--         vim.keymap.set({'n', 'v'}, '<Leader>la', vim.lsp.buf.code_action, opts)
--         vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format {async = true} end, opts)
--     end
-- })
