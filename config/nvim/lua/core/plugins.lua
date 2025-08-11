local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)



require("lazy").setup({
  { 'akinsho/bufferline.nvim' }, -- Табы вверух

  -- Автодополнение
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },                            -- Нижная линия

  { 'echasnovski/mini.pairs' }, -- [], '', "", {} ставит парами
  { 'echasnovski/mini.comment' }, -- Коментарий
  { 'echasnovski/mini.diff' },  -- Индикаторы Git

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
  },




  -- Форматирование и линтинг
  { 'stevearc/conform.nvim' },
  -- {'mfussenegger/nvim-lint'},

  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate"
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  { 'folke/which-key.nvim' },
  -----------------------------------------------------------


  {
    -- TODO НЕ РАБОТАЕТ CTRL + R в python
    'folke/noice.nvim',
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  }, -- Внешний вид командной строки

  -----------------------------------------------------------
  -- Цветовые схемы
  -----------------------------------------------------------
  {
    'catppuccin/nvim',
    name = "catppuccin",
    priority = 1000
  },
  {
    -- TODO !!!
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {}
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  -- { 'powerman/vim-plugin-ruscmd' },    -- Работают команды с русской раскладкой. Мешает!
})
