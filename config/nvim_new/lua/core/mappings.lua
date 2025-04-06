vim.g.mapleader = " "

local function set_normal_hotkey(key, command)
  vim.keymap.set("n", key, command, { noremap = true, silent = true })
end

local function set_insert_hotkey(key, command)
  vim.keymap.set("i", key, command, { noremap = true, silent = true })
end

local function set_visible_hotkey(key, command)
  vim.keymap.set("v", key, command, { noremap = true, silent = true })
end




-- Обшие
set_insert_hotkey('jk', '<Esc>')

-- Отключает стрелки 
-- set_normal_hotkey('<up>', "<cmd>echo 'Use k'<cr>" )
-- set_normal_hotkey('<down>', "<cmd>echo 'Use j'<cr>" )
-- set_normal_hotkey('<left>', "<cmd>echo 'Use h'<cr>" )
-- set_normal_hotkey('<right>', "<cmd>echo 'Use l'<cr>" )



-- NeoTree
local function swither_neotree()
  -- Функция которая откывает neo-tree если он не открот
  -- А если он открыт и если фокус на neo-tree то закрывает его
  -- Если нет фокуса, то фокусируеться на нем
  local neo_tree_winid = vim.fn.bufwinid(vim.fn.bufnr("neo-tree"))
  local current_winid = vim.fn.winnr()

  if neo_tree_winid > 1000 and current_winid == 1 then
    require('neo-tree.command').execute({ action = "close" })
  else
    require('neo-tree.command').execute({ action = "focus", reveal = true })
  end
end

set_normal_hotkey('<A-e>', swither_neotree)


