return {

  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  settings = {
    python = {
      analysis = {
        diagnosticSeverityOverrides = {
          -- "error", "warning", "information", "true", "false", "none"
          reportExplicitAny = false,
          reportAny = false,
          reportUnknownParameterType = false,
          reportUnknownArgumentType = false,
        },
        typeCheckingMode = "strict",
        --     ignore = {"*"},
      }
    },
    pyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
      -- disableLanguageServices = false,
      -- disableOrganizeImports = true,
    },
  },

}
