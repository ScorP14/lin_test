local keymap = vim.keymap

------------------------------------------------------------
-- Обшие
------------------------------------------------------------
vim.g.mapleader = " "
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
keymap.set("n", "<leader>q", "<cmd>nohlsearch<CR>", { desc = "Cancel Search" })

-- Работа с буфером обмена
keymap.set("v", "<leader>y", '"+y', { desc = "Cope in buffer system" })
keymap.set("v", "<leader>Y", '"+y$', { desc = "Cope in buffer system" })
keymap.set("n", "<leader>p", '"+p', { desc = "Past in buffer system" })
keymap.set("n", "<leader>P", '"+P', { desc = "Past in buffer system" })

keymap.set("n", "<leader>bq", '<Cmd>:bd<CR>', { desc = "Close Buffer" })

-- Отключение стрелок
-- keymap.set("n", '<up>', "<cmd>echo 'Use k'<cr>" , {desc = "NO! UP!"})
-- keymap.set("n", '<down>', "<cmd>echo 'Use j'<cr>", {desc = "NO! DOWN!"})
-- keymap.set("n", '<left>', "<cmd>echo 'Use h'<cr>" , {desc = "NO! LEFT!"})
-- keymap.set("n", '<right>', "<cmd>echo 'Use l'<cr>", {desc = "NO! RIGHT!"})

------------------------------------------------------------
-- BufferLine
------------------------------------------------------------
--- TODO - MB CTRL?
keymap.set("n", '<Leader>1', "<Cmd>BufferLineGoToBuffer 1<CR>")
keymap.set("n", '<Leader>2', "<Cmd>BufferLineGoToBuffer 2<CR>")
keymap.set("n", '<Leader>3', "<Cmd>BufferLineGoToBuffer 3<CR>")
keymap.set("n", '<Leader>4', "<Cmd>BufferLineGoToBuffer 4<CR>")
keymap.set("n", '<Leader>5', "<Cmd>BufferLineGoToBuffer 5<CR>")
keymap.set("n", '<tab>', "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Page" })
keymap.set("n", '<S-tab>', "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev Page" })

------------------------------------------------------------
-- Neotree
------------------------------------------------------------
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
keymap.set("n", '<leader>e', swither_neotree, { desc = "Open/Close/Select NeoTree" })

------------------------------------------------------------
-- Telescope
------------------------------------------------------------
local builtin = require('telescope.builtin')
keymap.set("n", '<leader>ff', builtin.find_files)
keymap.set("n", '<leader>fg', builtin.live_grep)
keymap.set("n", '<leader>fb', builtin.buffers)
keymap.set("n", '<leader>fh', builtin.help_tags)
-- -- Git
keymap.set("n", '<leader>gb', builtin.git_branches)
keymap.set("n", '<leader>gc', builtin.git_commits)
keymap.set("n", '<leader>gs', builtin.git_status)
-- -- LSP
keymap.set("n", '<leader>ls', builtin.lsp_document_symbols)
keymap.set("n", '<leader>ll', builtin.lsp_references)  -- Искать
keymap.set("n", '<leader>lg', builtin.lsp_definitions) -- Переместиться к классу
keymap.set("n", '<leader>lb', "<C-o>")                 -- Вернуться назад
--
local lsp_buf = require('vim.lsp.buf')
keymap.set("n", '<Leader>lr', lsp_buf.rename)
keymap.set("n", '<Leader>lf', lsp_buf.format)
keymap.set("n", '<Leader>lh', lsp_buf.hover) -- :TODO Мб хот-кей получше?
-- set_normal_hotkey('<Leader>lH', lsp_buf.signature_help)
-- set_normal_hotkey('<Leader>D', lsp_buf.type_definition)
keymap.set("n", '<Leader><enter>', lsp_buf.code_action)

keymap.set("n", '<Leader>li', function()
  vim.lsp.buf.code_action({
    context = { only = { "source.organizeImports" } },
    apply = true,
  })
end)



vim.api.nvim_create_autocmd('LspAttach', {
  desc = "LSP actions",
  -- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(event)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[event.buf].omnifunc = ':lua.vim.lsp.omnifunc'
    local opts = { buffer = event.buf }
    vim.keymap
        .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
      opts)
    vim.keymap.set('n', '<Leader>sl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
  end
})
