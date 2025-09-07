local keymap = vim.keymap

------------------------------------------------------------
-- Общие клавиатурные сокращения
------------------------------------------------------------
keymap.set("i", "jk", "<Esc>", { desc = "Выход из режима вставки" }) -- Быстрый выход из режима вставки сочетанием jk
keymap.set("n", "<leader>q", "<cmd>nohlsearch<CR>", { desc = "Отменить подсветку поиска" }) -- Отключить подсветку поиска

-- Перемещение строк в визуальном режиме
keymap.set("v", "<S-down>", ":m '>+1<cr>gv=gv", { desc = "Переместить выделение вниз" })
keymap.set("v", "<S-up>", ":m '<-1<cr>gv=gv", { desc = "Переместить выделение вверх" })

-- Отступы в визуальном режиме (подобно VS Code)
keymap.set("v", "<tab>", ">gv", { desc = "Увеличить отступ TAB" })
keymap.set("v", "<S-tab>", "<gv", { desc = "Уменьшить отступ TAB" })

-- Работа с системным буфером обмена
keymap.set("v", "<leader>y", '"+y', { desc = "Копировать в системный буфер" })
keymap.set("v", "<leader>Y", '"+y$', { desc = "Копировать до конца строки в системный буфер" })
keymap.set("n", "<leader>p", '"+p', { desc = "Вставить из системного буфера" })
keymap.set("n", "<leader>P", '"+P', { desc = "Вставить перед курсором из системного буфера" })

------------------------------------------------------------
-- Telescope (плагины поиска)
------------------------------------------------------------
local builtin = require('telescope.builtin')
keymap.set("n", '<leader>ff', builtin.find_files, { desc = "Поиск файлов" })
keymap.set("n", '<leader>fg', builtin.live_grep, { desc = "Поиск по содержимому" })
keymap.set("n", '<leader>fb', builtin.buffers, { desc = "Список открытых буферов" })
keymap.set("n", '<leader>fh', builtin.help_tags, { desc = "Поиск по справочным тегам" })
-- keymap.set("n", '<leader>fc', "<cmd>TodoTelescope<cr>", { desc = "Список TODO" })

keymap.set("n", '<leader>gb', builtin.git_branches, { desc = "Список веток Git" })
keymap.set("n", '<leader>gc', builtin.git_commits, { desc = "Список коммитов Git" })
keymap.set("n", '<leader>gs', builtin.git_status, { desc = "Статус Git" })

------------------------------------------------------------
-- LSP (интеграция с языковыми серверами)
------------------------------------------------------------
-- keymap.set("n", '<leader>ls', builtin.lsp_document_symbols, { desc = "Символы в документе" })
-- keymap.set("n", '<leader>ll', builtin.lsp_references, { desc = "Поиск ссылок (references)" })
-- keymap.set("n", '<leader>lg', builtin.lsp_definitions, { desc = "Перейти к определению" })
-- keymap.set("n", '<leader>lb', "<C-o>", { desc = "Назад к предыдущему месту" })
keymap.set("n", '<F3>', vim.lsp.buf.format, { desc = "Назад к предыдущему месту" })

-- local lsp_buf = require('vim.lsp.buf')
-- keymap.set("n", '<Leader>lr', lsp_buf.rename, { desc = "Переименовать символ" })
-- keymap.set("n", '<Leader>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { desc = "Форматирование кода" })
-- keymap.set("n", '<Leader>lh', lsp_buf.hover, { desc = "Показать документацию (hover)" })
-- keymap.set("n", '<Leader><enter>', lsp_buf.code_action, { desc = "Действия кода (code actions)" })

------------------------------------------------------------
-- Буфер и переключение вкладок
------------------------------------------------------------
keymap.set("n", '<tab>', "<Cmd>BufferLineCycleNext<CR>", { desc = "Следующая вкладка" })
keymap.set("n", '<S-tab>', "<Cmd>BufferLineCyclePrev<CR>", { desc = "Предыдущая вкладка" })

keymap.set("n", '<leader>e', "<cmd>NvimTreeFocus<cr>", { desc = "Открыть/Закрыть/Выбрать NvimTree" })
