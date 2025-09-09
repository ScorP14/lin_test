return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<S-Up>"] = "preview_scrolling_up",
            ["<S-Down>"] = "preview_scrolling_down"
          },
          n = {
            ["<S-Up>"] = "preview_scrolling_up",
            ["<S-Down>"] = "preview_scrolling_down"
          },
        },
      },
    }
  },
}
