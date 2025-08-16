return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    priority = 2000, -- FIX: Исправить баг с подверждением
    opts = {
      options = {
        mode = "buffer",
        -- mode = "tabs",
      },
    }
  },
  { "nvim-tree/nvim-web-devicons", lazy = true }
}
