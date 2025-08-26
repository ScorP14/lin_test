return {
  cmd = { 'pyright-langserver', "--stdio" },
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
      -- disableLanguageServices = true,
    },
    python = {
      analysis = {
        -- ignore = {"*"},
        typeCheckingMode = "strict", -- off, strict включить строгую типизацию
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = 'workspace', -- анализ всего проекта
        -- reportMissingTypeStubs = false, -- можно отключить ошибки по отсутствующим stubs, если надо
        --         reportUnusedImport = true,              -- предупреждения об неиспользованных импортах
      }
    },
  },
}
