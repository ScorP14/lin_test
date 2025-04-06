vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Автоустановка пакетного менеджера
  use 'wbthomason/packer.nvim'

  ---------------------------------------------------------
  -- ПЛАГИНЫ ВНЕШНЕГО ВИДА
  ---------------------------------------------------------
  -- Информационная строка вниз  
  use "kyazdani42/nvim-web-devicons"
  use { 'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
      require('lualine').setup()
  end, }

  -- Тема
  use {'morhetz/gruvbox',
      config = function()
      vim.cmd('colorscheme gruvbox')
  end, }

  ---------------------------------------------------------
  -- МОДУЛИ РЕДАКТОРА
  ---------------------------------------------------------
  -- Табы с вкладками сверху
    use {'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
      require("bufferline").setup{
        options = {
            mode = "tabs", -- set to "tabs" to only show tabpages instead
            numbers = "none"
    		  }
      	}
  end, }

  -- Файловый менеджер
  use { 'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() 
      require'nvim-tree'.setup {}
  end, }
  
  ---------------------------------------------------------
  -- ПОИСК
  ---------------------------------------------------------
  -- Наш FuzzySearch
  use { 'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function() 
      require'telescope'.setup {}
  end, }
    
  ---------------------------------------------------------
  -- КОД
  ---------------------------------------------------------
  --https://github.com/tpope/vim-surround
  -- автоматические закрывающиеся скобки
  use { 'windwp/nvim-autopairs',
      config = function()
      require("nvim-autopairs").setup()
  end }

  -- Комментирует по <gc> все, вне зависимости от языка программирования
  use { 'numToStr/Comment.nvim',
      config = function() 
      require('Comment').setup() 
  end }

  ---------------------------------------------------------
  -- LSP И АВТОДОПОЛНЯЛКИ
  ---------------------------------------------------------
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Автодополнялка
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'

  --- Автодополнлялка к файловой системе
  use 'hrsh7th/cmp-path'

  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'

  -- Линтер, работает для всех языков
  use 'dense-analysis/ale'
  ---------------------------------------------------------
  -- РАЗНОЕ
  ---------------------------------------------------------
  -- Даже если включена русская раскладка, то nvim-команды будут работать
  use 'powerman/vim-plugin-ruscmd'
end )











