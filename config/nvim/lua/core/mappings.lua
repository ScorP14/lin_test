vim.g.mapleader = " "
------------------------------------------------------------
-- Utils
------------------------------------------------------------
local function set_normal_hotkey(key, command)
  vim.keymap.set("n", key, command, { noremap = true, silent = true })
end

local function set_insert_hotkey(key, command)
  vim.keymap.set("i", key, command, { noremap = true, silent = true })
end

local function set_visible_hotkey(key, command)
  vim.keymap.set("v", key, command, { noremap = true, silent = true })
end

local function swither_neotree()
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

------------------------------------------------------------
-- Обшие
------------------------------------------------------------
set_insert_hotkey('jk', '<Esc>')
set_normal_hotkey('<leader>q', "<cmd>nohlsearch<CR>")

set_visible_hotkey('<leader>y', '"+y') -- Скопировать в буффер системы
set_visible_hotkey('<leader>Y', '"+y$')
set_normal_hotkey('<leader>p', '"+p')  -- Вставить из буффера системы
set_normal_hotkey('<leader>P', '"+P')

set_normal_hotkey('<leader>t', "<cmd>ToggleTerm<CR>")
-- Отключает стрелки
-- set_normal_hotkey('<up>', "<cmd>echo 'Use k'<cr>" )
-- set_normal_hotkey('<down>', "<cmd>echo 'Use j'<cr>" )
-- set_normal_hotkey('<left>', "<cmd>echo 'Use h'<cr>" )
-- set_normal_hotkey('<right>', "<cmd>echo 'Use l'<cr>" )

------------------------------------------------------------
-- BufferLine
------------------------------------------------------------
--- TODO - MB CTRL?
set_normal_hotkey('<Leader>1', "<Cmd>BufferLineGoToBuffer 1<CR>")
set_normal_hotkey('<Leader>2', "<Cmd>BufferLineGoToBuffer 2<CR>")
set_normal_hotkey('<Leader>3', "<Cmd>BufferLineGoToBuffer 3<CR>")
set_normal_hotkey('<Leader>4', "<Cmd>BufferLineGoToBuffer 4<CR>")
set_normal_hotkey('<Leader>5', "<Cmd>BufferLineGoToBuffer 5<CR>")
set_normal_hotkey('<Leader>6', "<Cmd>BufferLineGoToBuffer 6<CR>")
set_normal_hotkey('<Leader>7', "<Cmd>BufferLineGoToBuffer 7<CR>")
set_normal_hotkey('<Leader>8', "<Cmd>BufferLineGoToBuffer 8<CR>")
set_normal_hotkey('<Leader>9', "<Cmd>BufferLineGoToBuffer 9<CR>")
set_normal_hotkey('<tab>', "<Cmd>BufferLineCycleNext<CR>")
set_normal_hotkey('<S-tab>', "<Cmd>BufferLineCyclePrev<CR>")

------------------------------------------------------------
-- NeoTree
------------------------------------------------------------
-- set_normal_hotkey('<A-e>', swither_neotree)
set_normal_hotkey('<leader>e', swither_neotree)

------------------------------------------------------------
-- Terminal
------------------------------------------------------------
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
------------------------------------------------------------
-- Telescope
------------------------------------------------------------
local builtin = require('telescope.builtin')
set_normal_hotkey('<leader>ff', builtin.find_files)
set_normal_hotkey('<leader>fg', builtin.live_grep)
set_normal_hotkey('<leader>fb', builtin.buffers)
set_normal_hotkey('<leader>fh', builtin.help_tags)
-- Git
set_normal_hotkey('<leader>gb', builtin.git_branches)
set_normal_hotkey('<leader>gc', builtin.git_commits)
set_normal_hotkey('<leader>gs', builtin.git_status)
-- LSP
set_normal_hotkey('<leader>ls', builtin.lsp_document_symbols)
set_normal_hotkey('<leader>ll', builtin.lsp_references)  -- Искать
set_normal_hotkey('<leader>lg', builtin.lsp_definitions) -- Переместиться к классу
set_normal_hotkey('<leader>lb', "<C-o>")                 -- Вернуться назад

local lsp_buf = require('vim.lsp.buf')
set_normal_hotkey('<Leader>lr', lsp_buf.rename)
set_normal_hotkey('<Leader>lf', lsp_buf.format)
set_normal_hotkey('<Leader>lh', lsp_buf.hover) -- :TODO Мб хот-кей получше?
-- set_normal_hotkey('<Leader>lH', lsp_buf.signature_help)
-- set_normal_hotkey('<Leader>D', lsp_buf.type_definition)
set_normal_hotkey('<Leader>lc', lsp_buf.code_action)



vim.api.nvim_create_autocmd('LspAttach', {
  desc = "LSP actions",
  -- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(event)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[event.buf].omnifunc = ':lua.vim.lsp.omnifunc'
    local opts = { buffer = event.buf }
    -- vim.keymap
    --     .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
    --   opts)
    -- vim.keymap.set('n', '<Leader>sl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
  end
})
