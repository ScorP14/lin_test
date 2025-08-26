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
