local cmd = vim.cmd
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

-- Закрывать NvimTree после закрытия окна 
-- vim.api.nvim_create_autocmd({"QuitPre"}, {
--   callback = function() vim.cmd("NvimTreeClose") end,
-- })
