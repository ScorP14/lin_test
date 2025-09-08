return {
  cmd = { 'ruff', 'server' },
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
  init_options = {
    settings = {
      lint = {
        -- ignore = { "ALL" }
      },
    },
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}
