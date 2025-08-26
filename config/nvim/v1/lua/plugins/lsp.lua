-- local capabilities = {
--   textDocument = {
--     foldingRange = {
--       dynamicRegistration = false,
--       lineFoldingOnly = true
--     }
--   }
-- }
--
-- capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.lsp.enable({
  "ruff",
  "pyright",
  "luals",
})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format()
    vim.lsp.buf.code_action({context = {only = {"source.organizeImports"}}, apply = true})
  end
})
