return {
  cmd = {'pyright-langserver', "--stdio"},
  filetypes = {"python", ".py"},
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },
  settings = {
    pyright = {
      -- disableLanguageServices = true,
    },
    python = {
      analysis = {
        -- ignore = {"*"},
        typeCheckingMode = "strict", -- off, strict
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        autoSearchPaths = true,
      }
    },
  },
}
