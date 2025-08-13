local opt = vim.opt
local cmd = vim.cmd

-----------------------------------------------------------
-- ОБЩИЕ ОПЦИИ
-----------------------------------------------------------
vim.g.mapleader = " "

opt.mouse = 'a'                  -- Включить поддержку мыши во всех режимах 
opt.encoding = 'utf-8'           -- Кодировка
opt.showcmd = true               -- Отображение команд
opt.swapfile = false             -- Не создаем свап файлы
opt.autoread = true              -- Авточтение файлов при изменение извне 
-- opt.clipboard = "unnamedplus" --"unnamed"
opt.cursorline = true            -- Подсветка строки с курсором
opt.wrap = true                  -- Перенос длинных строк 
opt.wildmenu = true              -- Автодополнение команд 
opt.scrolloff = 7                -- Показывать табы вверху со N вкладок
opt.showtabline = 1
opt.termguicolors = true         -- Подержка 24-битных цветов
opt.so = 5                       -- Отступ курсора от края экрана
opt.foldcolumn = '2'             -- Ширина колонки для фолдов
opt.colorcolumn =  '130'         -- Расположение цветной колонки

-- Нумерация строк и относительные номера
opt.number = true             
-- opt.relativenumber = true     

-- Табы и пробелы
opt.shiftwidth = 2            -- Смещаем на 4 пробела
opt.tabstop = 2               -- 1 tab = 2 пробела
opt.expandtab = true          -- ???
opt.smartindent = true

-- Поиск 
opt.ignorecase = true        -- Нечувствительный к регистру поиск 
-- opt.smartcase = true      -- Чувствительный к регистру поиск
opt.hlsearch = true          -- Подсвечивает все совпадения при поиске 
opt.incsearch = true         -- Показывает совпадения по мере ввода поиского запроса 

cmd [[autocmd FileType python setlocal shiftwidth=4 tabstop=4]]
-- cmd [[autocmd FileType python map <buffer> <C-r> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>]] -- Запуск Python скрипта
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
cmd([[
    filetype indent plugin on 
    syntax enable
]])

-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
  augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
  augroup end
]], false)
