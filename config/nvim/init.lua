local sources = {
  -- Basic config
  "core.plugins",
  "core.base",
  "core.mappings",

  -- Plugins
  "plugins.bufferline", -- TODO
  "plugins.cmp",
  "plugins.conform",
  "plugins.lsp",
  "plugins.lualine",
  "plugins.mason",
  "plugins.mini_comment",
  "plugins.mini_diff",
  "plugins.mini_pairs",
  "plugins.neotree",
  -- "plugins.noice", -- Красивая строка ввода команд. Надо?!
  "plugins.toggleterm",
  "plugins.treesitter",
  "plugins.which-key",
  --
}


for _, source in ipairs(sources) do
  local status, fault = pcall(require, source)
  if not status then
    error("Failed to load " .. source .. "\n\n" .. fault)
  end
end
