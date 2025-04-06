local sources = {
-- Basic config
  "core.plugins",
  "core.mappings",
  "core.base",

-- Plugins
  "plugins.treesitter",
  "plugins.lsp",
  "plugins.comment",
  "plugins.mason",
  "plugins.mini_pairs",
  "plugins.telescope",
}


for _, source in ipairs(sources) do
  local status, fault = pcall(require, source)
  if not status then
    error("Failed to load " .. source .. "\n\n" .. fault)
  end
end

