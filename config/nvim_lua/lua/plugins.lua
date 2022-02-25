vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()

  -- Packer сам себя
  use 'wbthomason/packer.nvim'
  -----------------------------------------------------------
  -- Конфиг для LSP ?
  -----------------------------------------------------------
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  -----------------------------------------------------------
  -- Автодополнялка
  -----------------------------------------------------------
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-path' -- Автодополнлялка к файловой системе
  -----------------------------------------------------------
  -- Цветовые схемы
  -----------------------------------------------------------
  use 'morhetz/gruvbox'
  use 'mhartington/oceanic-next'
  use 'joshdick/onedark.vim'
  -----------------------------------------------------------
  -- Для Python
  -----------------------------------------------------------
  -- Поддержка темплейтом jinja2
  use 'mitsuhiko/vim-jinja'
  -----------------------------------------------------------
  -- Для HTML
  -----------------------------------------------------------
  use 'idanarye/breeze.vim' -- Подсвечивает закрывающий и откры. тэг. HTML 
  use 'alvan/vim-closetag'  -- Закрывает автоматом html и xml тэги. Пишешь <h1> и он автоматом закроется </h1
    use 'ap/vim-css-color'  -- Подсвечивает #ffffff в CSS файлах
  use 'mattn/emmet-vim' -- Обрамляет строку в теги по ctrl- y + ,
  -----------------------------------------------------------
  -- РАЗНОЕ
  -----------------------------------------------------------
  use 'vim-airline/vim-airline' -- Статус бар
  use 'vim-airline/vim-airline-themes' -- темы для статус Бара

-- Табы вверху
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}



  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'
  -- Даже если включена русская раскладка vim команды будут работать
  use 'powerman/vim-plugin-ruscmd'
  -- 'Автоформатирование' кода для всех языков
  -- https://github.com/vim-autoformat/vim-autoformat
  use 'Chiel92/vim-autoformat'
  -- Обрамляет или снимает обрамление. Выдели слово, нажми S и набери <h1>
  use 'tpope/vim-surround'
  -- Комментирует по gc все, вне зависимости от языка программирования
  -- https://github.com/numToStr/Comment.nvim
  use { 'numToStr/Comment.nvim',
  config = function() require('Comment').setup() end }

  -- Закрывает автоматом скобки
  use 'cohama/lexima.vim'
  -- Линтер, работает для всех языков(показывает ошибки в коде)
  use 'dense-analysis/ale'
  -- https://github.com/kyazdani42/nvim-tree
  -- Файловый менеджер
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require'telescope'.setup {} end,
  }
  -- Подстветка синтаксиса? https://github.com/nvim-treesitter/nvim-treesitter
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
end)

