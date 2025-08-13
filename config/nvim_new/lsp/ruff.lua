return {
  cmd = { 'ruff', "server" },
  filetypes = { "python", ".py" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },
  settings = {
    pyright = {
      analysis = {
        -- autoSearchPaths = true,
        -- useLibraryCodeForTypes = true,
        -- diagnosticMode = "openFileOnly",
      }
    },
  }
}
