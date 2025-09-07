vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function()
    require("config.keymaps").for_lsp()
  end,
})

vim.lsp.enable({
  "lua-language-server",
  "basedpyright",
  "ruff",
})
