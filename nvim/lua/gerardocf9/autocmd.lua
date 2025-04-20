-- Asegúrate de que el módulo de comandos automático esté activado
vim.cmd [[
  augroup Indentation
    autocmd!
    autocmd FileType javascript,typescript,javascriptreact,typescriptreact,css,html setlocal shiftwidth=2 tabstop=2
  augroup END
]]

