return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffer", -- buffer, tabs
      diagnostics = "nvim_lsp",
    },
  },
}
