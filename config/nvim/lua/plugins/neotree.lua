require("neo-tree").setup({
  close_if_last_window = true, 

  window = {
    position = "left",
    width = 35,
  }
})  



-- config = function()
--       require("nvim-tree").setup({
--         view = { width = 30 },
--         filters = { dotfiles = false },
--         git = { enable = true },
--         actions = {
--           open_file = {
--             quit_on_open = true, -- закроет дерево после открытия файла
--           },
--         },
--         -- авто-закрытие при последнем буфере
--         -- только если включена эта настройка:
--         hijack_netrw = true,
--       })
--     end,
