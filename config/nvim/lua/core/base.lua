local opt = vim.opt
local cmd = vim.cmd


-----------------------------------------------------------
-- ОБЩИЕ ОПЦИИ
-----------------------------------------------------------
opt.mouse = 'a'               --Включит мышь
opt.encoding = 'utf-8'        --Кодировка
opt.showcmd = true            --Отображение команд
opt.swapfile = false          --Не создаем свап файлы
-- opt.clipboard = "unnamedplus" --"unnamed"

-----------------------------------------------------------
-- ВИЗУАЛЬНЫЕ ОПЦИИ
-----------------------------------------------------------
opt.number = true             --Номер строк сбоку
opt.wrap = true               --Длинные линии будет видно
opt.expandtab = true          --???
opt.tabstop = 2               --1 tab = 2 пробела
opt.smartindent = true
opt.shiftwidth = 2            --Смещаем на 4 пробела
opt.scrolloff = 7             -- Показывать табы вверху со N вкладок
opt.showtabline = 1

opt.termguicolors = true      -- Подержка 24-битных цветов
cmd.colorscheme("catppuccin") -- gruvbox, catppuccin

opt.so = 5                   --Отступ курсора от края экрана
opt.foldcolumn = '2'         --Ширина колонки для фолдов
opt.colorcolumn =  '130'     --Расположение цветной колонки

-- remove line lenght marker for selected filetypes

opt.cursorline = true        -- Подсветка строки с курсором

cmd [[autocmd FileType python setlocal shiftwidth=4 tabstop=4]]
cmd [[autocmd FileType python map <buffer> <C-r> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>]]

cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
cmd(
  [[
    filetype indent plugin on 
    syntax enable
  ]]
)




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

