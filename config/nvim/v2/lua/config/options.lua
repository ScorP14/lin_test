local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Отключить netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.mouse = 'a'          -- Включить поддержку мыши во всех режимах
opt.encoding = 'utf-8'   -- Кодировка
opt.showcmd = true       -- Отображение команд
opt.swapfile = false     -- Не создаем свап файлы
opt.autoread = true      -- Авточтение файлов при изменение извне
opt.confirm = true       -- Подтверждение на сохранение
-- opt.clipboard = "unnamedplus" --"unnamed"
opt.cursorline = true    -- Подсветка строки с курсором
opt.wrap = true          -- Перенос длинных строк
opt.wildmenu = true      -- Автодополнение команд
opt.scrolloff = 7        -- Показывать табы вверху со N вкладок
opt.showtabline = 1
opt.termguicolors = true -- Подержка 24-битных цветов
opt.so = 5               -- Отступ курсора от края экрана
opt.foldcolumn = '2'     -- Ширина колонки для фолдов
opt.colorcolumn = '130'  -- Расположение цветной колонки

-- Нумерация строк и относительные номера
opt.number = true
-- opt.relativenumber = true

-- Табы и пробелы
opt.shiftwidth = 2   -- Смещаем на 4 пробела
opt.tabstop = 2      -- 1 tab = 2 пробела
opt.expandtab = true -- ???
opt.smartindent = true

-- Поиск
opt.ignorecase = true -- Нечувствительный к регистру поиск
-- opt.smartcase = true      -- Чувствительный к регистру поиск
opt.hlsearch = true   -- Подсвечивает все совпадения при поиске
opt.incsearch = true  -- Показывает совпадения по мере ввода поиского запроса

-- Подсветка ошибок Lsp в линию
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
