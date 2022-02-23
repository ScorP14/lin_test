local cmd = vim.cmd
local set = vim.opt



local M = {}

-----------------------------------------------------------
-- Главные
-----------------------------------------------------------
set.fileencoding = "utf-8"      --Кодирование содержимого файла для буфера
set.mouse = "a" 			          -- Включает мышь
set.spelllang = {'en_us', 'ru'} -- Помощник, анг и русс
set.number = true 			        -- Показывает нумерацию строк
set.relativenumber = true       -- Показать строку относительного номера 
set.colorcolumn = "80"          -- Граница строки в заданное число
--set.cursorline = true         -- Выделияет текушию строку  
--set.so = 999                  -- Курсор всегда в центре экрана
set.splitbelow = true           -- Разделение нового окна ниже текущего 
set.splitright = true           -- Разделение нового окна справа от текущего.
set.swapfile = false            -- Ипользование файла подкачки для буфера
set.ignorecase = true           -- Поиск без учета регистра
set.clipboard = "unnamedplus" 	-- Подключение к системному буферу обмена
set.cmdheight = 1               -- Количество строк экрана, используемых для командной строки
--set.wrap = false              -- Отключить перенос строк, длина которых превышает ширину окна. 
set.smartindent = true                      -- Автоматический отступ при запуске новой строки
set.smartcase = false                       -- Поиск с учетом регистра

set.hlsearch = true                         -- Выделить все совпадения шаблона поиска
set.backup = false 			                -- Отключить создание резервной копии файла
set.writebackup = false                     -- Отключить создание резервной копии перед перезаписью файла 
set.showmode = true                         -- Отображение режимов в командной строке
set.timeoutlen = 300                        -- Продолжительность ожидания отображенной последовательности
set.updatetime = 300                        -- Время ожидания перед запуском плагина
set.history = 100                           -- Количество команд для запоминания в таблице истории 
--set.sidescrolloff = 8                     -- Количество столбцов, которые нужно сохранить по бокам курсора 
--set.pumheight = 10                        -- Высота всплывающего меню 
--set.conceallevel = 0                      -- Показывать текст в обычном режиме

set.hidden = true 			                -- Игнорировать несохраненные буферы
set.signcolumn = "auto" 		            -- (было да)Всегда показывать столбец знака
--set.spell = false                         -- Проверка орфографии и выделение?

--set.foldmethod = "manual"                 -- Создавать складки вручную 
--set.completeopt = { "menuone", "noselect" } -- Параметры для завершения режима вставки 


--set.undofile = true                       -- Включить постоянную отмену 


-----------------------------------------------------------
-- Цветовая схема
-----------------------------------------------------------
set.termguicolors = true      --  24-bit RGB colors

--[[
cmd'colorscheme onedark'
cmd'colorscheme OceanicNext'
cmd'colorscheme meterial'
cmd'colorscheme ayu'
cmd'colorscheme gruvbox'
]]--

cmd'colorscheme gruvbox'

-----------------------------------------------------------
-- Табы и отступы
-----------------------------------------------------------
cmd([[
filetype indent plugin on
syntax enable
]])
set.tabstop = 4           -- 1 tab == 4 spaces
set.expandtab = true 			            -- Разрешить использование пространства на вкладке
set.shiftwidth = 4
set.softtabstop = 4
set.scrolloff = 7                         -- Количество столбцов, которые нужно сохранить по бокам курсора 
set.smartindent = true    -- autoindent new lines
-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]
-- С этой строкой отлично форматирует html файл, который содержит jinja2
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]





-----------------------------------------------------------
-- Xз 
-----------------------------------------------------------

local g = vim.g
-- Путь до Python
g.python3_host_prog = "/usr/bin/python"




-----------------------------------------------------------
-- Установки для плагинов
-----------------------------------------------------------
-- LSP settings
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "sumneko_lua" then
        -- only apply these settings for the "sumneko_lua" server
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the 'vim', 'use' global
                    globals = {'vim', 'use'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end
    server:setup(opts)
end)




-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
        end,
    },
    -- Авто комплит
    completion = {
      autocomplete = false
    },
    -- Горячие клавишы
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close()
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', option = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        },
    },
},
}





return M

