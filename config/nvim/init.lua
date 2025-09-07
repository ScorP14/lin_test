local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if vim.loader then
  vim.loader.enable()
end

require("config.options")

require("lazy").setup({
  defaults = {
    lazy = true, },
  spec = {
    { import = "plugins" },
  },
  rocks = {
    enabled = false,
  },
  checker = { enabled = false, notify = false },
  install = {},
})

require("config.keymaps")
require("config.autocmds")
require("config.lsp")

vim.cmd.colorscheme("catppuccin-macchiato")
