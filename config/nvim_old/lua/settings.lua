local opt = vim.opt

-----------------------------------------------------------
-- ОБЩИЕ ОПЦИИ
-----------------------------------------------------------
opt.mouse = 'a'              --Включит мышь
opt.encoding = 'utf-8'       --Кодировка
opt.showcmd = true           --Отображение команд
vim.cmd([[
filetype indent plugin on
syntax enable
]])
opt.swapfile = false         --Не создаем свап файлы

-----------------------------------------------------------
-- ВИЗУАЛЬНЫЕ ОПЦИИ
-----------------------------------------------------------
opt.number = true            --Номер строк сбоку
opt.wrap = true              --Длинные линии будет видно
opt.expandtab = true         --???
opt.tabstop = 4              --1 tab = 4 пробела
opt.smartindent = true
opt.shiftwidth = 4           --Смещаем на 4 пробела

opt.scrolloff = 7
-- Показывать табы вверху со N вкладок
opt.showtabline=1




-- 2 Пробела для данных типов
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]

opt.so = 5                   --Отступ курсора от края экрана
opt.foldcolumn = '2'         --Ширина колонки для фолдов
opt.colorcolumn =  '130'     --Расположение цветной колонки

-- remove line lenght marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

opt.cursorline = true        -- Подсветка строки с курсором
opt.termguicolors = true

-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0

-----------------------------------------------------------
-- НАСТРОЙКИ ПОИСКА
-----------------------------------------------------------
-- Будет игнорировать размер букв при поиске
opt.ignorecase = true        --Игнорировать размер букв
opt.smartcase = true         --Игнор прописных буквj

-----------------------------------------------------------
-- ПОЛЕЗНЫЕ ФИШКИ
-----------------------------------------------------------
-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)

-----------------------------------------------------------
-- НАСТРОЙКИ ПЛАГИНОВ
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
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'
luasnip.setup {
        completion = {
          autocomplete = false
        }
}


  -- use { 'L3MON4D3/LuaSnip',
  --     config = function() 
  --     require('LuaSnip').setup(
  --       completion = {
  --         autocomplete = false
  --       }
  --     ) 
  -- end }









-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    completion = {
        -- Автоматическая подсказка
        autocomplete = false
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
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




local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)  -- поиск выделеного слова   
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)   -- поиск выделеного слова Чув. к Регист? 
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders)))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
