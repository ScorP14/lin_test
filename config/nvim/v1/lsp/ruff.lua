return {
  cmd = { 'ruff', "server" },
  filetypes = { "python" },
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
  },
  on_attach = function(client, bufnr)
    -- Отключим возможности Ruff, которые пересекаются с Pyright, например, hover и переименование
    -- client.server_capabilities.hoverProvider = false
    client.server_capabilities.renameProvider = false
    client.server_capabilities.completionProvider = false
  end,
}
