local sources = {
  "base",
  "plugins.setup",
  "mappings",
  "post_init",

  "plugins.blink",
  "plugins.bufferline",
  "plugins.lsp",
  "plugins.lualine",
  "plugins.mini_diff",
  "plugins.mini_pairs",
  "plugins.neotree",
  "plugins.telescope",
  "plugins.treesitter",
}

for _, source in ipairs(sources) do
  local status, fault = pcall(require, source)
  if not status then
    error("Failed to load " .. source .. "\n\n" .. fault)
  end
end
