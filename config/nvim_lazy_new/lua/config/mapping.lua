local keymap = vim.keymap

------------------------------------------------------------
-- Общие
------------------------------------------------------------
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
keymap.set("n", "<leader>q", "<cmd>nohlsearch<CR>", { desc = "Cancel Search" })

keymap.set("v", "<S-down>", ":m '>+1<cr>gv=gv", { desc = "Moves lines down in visual selection" })
keymap.set("v", "<S-up>", ":m '<-1<cr>gv=gv", { desc = "Moves lines up in visual selection" })

-- Tab S+Tab (Как в Vs Code)
keymap.set("v", "<tab>", ">gv", { desc = "Right tab" })
keymap.set("v", "<S-tab>", "<gv", { desc = "Left tab" })

-- Работа с буфером обмена
keymap.set("v", "<leader>y", '"+y', { desc = "Cope in buffer system" })
keymap.set("v", "<leader>Y", '"+y$', { desc = "Cope in buffer system" })
keymap.set("n", "<leader>p", '"+p', { desc = "Past in buffer system" })
keymap.set("n", "<leader>P", '"+P', { desc = "Past in buffer system" })


-- Telescope
local builtin = require('telescope.builtin')
keymap.set("n", '<leader>ff', builtin.find_files)
keymap.set("n", '<leader>fg', builtin.live_grep)
keymap.set("n", '<leader>fb', builtin.buffers)
keymap.set("n", '<leader>fh', builtin.help_tags)
keymap.set("n", '<leader>fc', "<cmd>TodoTelescope<cr>")
-- Git
keymap.set("n", '<leader>gb', builtin.git_branches)
keymap.set("n", '<leader>gc', builtin.git_commits)
keymap.set("n", '<leader>gs', builtin.git_status)
-- LSP
keymap.set("n", '<leader>ls', builtin.lsp_document_symbols)
keymap.set("n", '<leader>ll', builtin.lsp_references)  -- Искать
keymap.set("n", '<leader>lg', builtin.lsp_definitions) -- Переместиться к классу
keymap.set("n", '<leader>lb', "<C-o>")                 -- Вернуться назад

local lsp_buf = require('vim.lsp.buf')
keymap.set("n", '<Leader>lr', lsp_buf.rename)
-- keymap.set("n", '<Leader>lf', lsp_buf.format)
keymap.set("n", '<Leader>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
keymap.set("n", '<Leader>lh', lsp_buf.hover) -- :TODO Мб хот-кей получше?
keymap.set("n", '<Leader><enter>', lsp_buf.code_action)

-- NvimTree
-- keymap.set("n", '<leader>e', "<cmd>NvimTreeToggle<cr>", { desc = "Open/Close/Select NeoTree" })

-- BufferLine
keymap.set("n", '<tab>', "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Page" })
keymap.set("n", '<S-tab>', "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev Page" })

-- Neotree
function swither_neotree()
  -- Функция которая откывает neo-tree если он не открыт
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

-- keymap.set("n", '<leader>e', "<cmd>Neotree toggle<cr>", { desc = "Open/Close/Select NeoTree" })
keymap.set("n", '<leader>e', swither_neotree, { desc = "Open/Close/Select NeoTree" })
