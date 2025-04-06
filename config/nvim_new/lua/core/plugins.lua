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
	{'phaazon/hop.nvim'},
	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
  	dependencies = {
      "nvim-lua/plenary.nvim",
    	"nvim-tree/nvim-web-devicons",  
    	"MunifTanjim/nui.nvim",
    },
  },

	{'nvim-treesitter/nvim-treesitter'},
  -- Автодополнение
	{'hrsh7th/nvim-cmp', 
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
	{'neovim/nvim-lspconfig', 
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- Форматирование и линтинг
  {'stevearc/conform.nvim',
    opts = {},
  },
  {'mfussenegger/nvim-lint'},


  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

-----------------------------------------------------------
  {'echasnovski/mini.pairs'}, -- [], '', "", {} ставит парами
  -- {'echasnovski/mini.diff'}, -- Индикаторы Git 
  {'numToStr/Comment.nvim'},  -- Коментирует код 
  -- akinsho/bufferline.nvim  -- Табы вверух
  -- nvim-lualine/lualine     -- Нижная линия
-----------------------------------------------------------
-- Цветовые схемы 
-----------------------------------------------------------
  {
    'catppuccin/nvim', 
    name = "catppuccin", 
    priority = 1000
  },
  {'morhetz/gruvbox'},




  {
    -- TODO !!! 
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {}
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  -- { 'powerman/vim-plugin-ruscmd' },    -- Работают команды с русской раскладкой
})

