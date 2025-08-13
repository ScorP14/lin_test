require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "python",
    "lua",
    "bash",

    "jinja",
    "html",
    "css",

    "gitignore",
    "sql",

    "http",
    "nginx",
    "tmux",
    "vim",

    "json",
    "ini",
    "toml",
    "yaml",
    "csv",
    "markdown",
    "markdown_inline"
},



  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
