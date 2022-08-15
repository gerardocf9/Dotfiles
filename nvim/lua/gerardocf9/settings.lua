
vim.cmd("set title") -- Muestra el nombre del archivo en la ventana de la terminal

-- cursor
vim.o.ma = true -- Permite la integración del mouse (seleccionar texto, mover el cursor)
vim.cmd("set mouse=a  ")-- Permite la integración del mouse (seleccionar texto, mover el cursor)
vim.o.scrolloff = 8 --mantiene el cursoe en el centro 8 lineas siempre arriba o abajo
vim.o.guicursor = true --vim.cmd("set guicursor") --cursor siempre como bloque
--set cursorline   Resalta la línea actual

-- Numeros
vim.o.nu = true -- muestra el numero de linea
vim.o.relativenumber = true --  Muestra los números relativos

vim.o.exrc = true -- un vim.rc para cada proyecto

--set noerrorbells "no muestra errores...
vim.o.hidden = true -- Permitir cambiar de buffers sin tener que guardarlos

-- Indentación a 4 espacios
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.softtabstop=4
vim.o.shiftround = true
vim.o.expandtab =true --  Insertar espacios en lugar de <Tab>s
vim.o.smartindent = true
-- vim.o.autoindent = true

-- Backup
vim.opt.wrap = false --set nowrap  " No dividir la línea si es muy larga
vim.o.swapfile = false
vim.o.backup = false --set nobackup
HOME = os.getenv("HOME")
vim.o.undofile = true
vim.opt.undodir = HOME .. "/.vim/undodir"
vim.o.undofile = true
-- Undo and backup options
vim.o.writebackup = false
-- vim.o.backupdir = '/tmp/'
-- vim.o.directory = '/tmp/'
-- vim.o.undodir = '/tmp/'
-- Remember 50 items in commandline history
vim.o.history = 50

-- Busqueda
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true -- Ignorar mayúsculas al hacer una búsqueda
vim.o.smartcase = true --busqueda inteligente con letras mayusculas o minusculas
vim.o.hlsearch = false--set nohlsearch "no se mantiene resaltado en busqueda
vim.o.incsearch = true -- busqueda incremental

--Activa true colors en la terminal
vim.o.termguicolors = true

--vim.o.colorcolumn = 80 --set colorcolumn=100  Muestra la columna límite a 80 caracteres
vim.cmd([[
set colorcolumn=80  " Muestra la columna límite a 80 caracteres
highlight ColorColumn ctermbg=0 guibg=lightgrey
set signcolumn=yes "columna adicional
    ]])


--"setlocal spell
--"set spelllang=es,en  " Corregir palabras usando diccionarios en inglés y español
--"setlocal nospell spelllang=es,en
--"set spellfile=~/.vim/spell/es.utf-8.spl

-- Makes neovim and host OS clipboard play nicely with each other
vim.o.clipboard = 'unnamedplus'

-- Better buffer splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- Map <leader> to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


