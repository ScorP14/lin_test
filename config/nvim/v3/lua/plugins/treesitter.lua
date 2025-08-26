return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      sync_install = false,
      auto_install = true,
      ensure_installed = {
        "bash",
        "css",
        "csv",
        "diff",
        "gitignore",
        "html",
        "http",
        "ini",
        "jinja",
        "json",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "nginx",
        "python",
        "query",
        "regex",
        "sql",
        "tmux",
        "toml",
        "vim",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    ft = { "python", "go", "lua" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      enable = true,           -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0,           -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 1,   -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 1, -- Maximum number of lines to show for a single context
      trim_scope = "outer",    -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "topline",        -- Line used to calculate context. Choices: 'cursor', 'topline'
      separator = nil,
      zindex = 20,
    },
  }
}
