local sources = {
-- Basic config
  "core.plugins",
  "core.mappings",
  "core.base",

-- Plugins
  "plugins.bufferline",
  "plugins.treesitter",
  "plugins.lsp",
  "plugins.lualine",
  -- "plugins.comment",
  "plugins.mason",
  "plugins.mini_comment",
  "plugins.mini_diff",
  "plugins.mini_pairs",
  "plugins.noice",
  "plugins.telescope",
}


for _, source in ipairs(sources) do
  local status, fault = pcall(require, source)
  if not status then
    error("Failed to load " .. source .. "\n\n" .. fault)
  end
end

