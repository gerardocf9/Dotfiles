
set title  " Muestra el nombre del archivo en la ventana de la terminal

"cursor
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)
set scrolloff=8 "mantiene el cursoe en el centro 8 lineas siempre arriba o abajo
set guicursor= "cursor siempre como bloque
"set cursorline  " Resalta la línea actual

"Numeros
set relativenumber  " Muestra los números relativos
set nu " muestra el numero de linea

set exrc "un vim.rc para cada proyecto
set nowrap  " No dividir la línea si es muy larga

set noerrorbells "no muestra errores...
set hidden  " Permitir cambiar de buffers sin tener que guardarlos

" Indentación a 4 espacios
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s
set smartindent

"backup
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

"Busqueda
set nohlsearch "no se mantiene resaltado en busqueda
set incsearch "busqueda incremental
set smartcase "busqueda inteligente con letras mayusculas o minusculas
set ignorecase  " Ignorar mayúsculas al hacer una búsqueda

set termguicolors  " Activa true colors en la terminal

set colorcolumn=100  " Muestra la columna límite a 80 caracteres
highlight ColorColumn ctermbg=0 guibg=lightgrey
set signcolumn=yes "columna adicional


"setlocal spell
"set spelllang=es,en  " Corregir palabras usando diccionarios en inglés y español
"setlocal nospell spelllang=es,en
"set spellfile=~/.vim/spell/es.utf-8.spl

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall




"****************pluggings*************


call plug#begin('~/.vim/plugged')

"higlight
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/lsp_extensions.nvim'

"Auto pairs
Plug 'jiangmiao/auto-pairs'

"themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'


"Snippets
 " Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'


" Clossing tabs
Plug 'alvan/vim-closetag'

"Nerd tree
Plug 'preservim/nerdtree'

"Ident
Plug 'Yggdroot/indentLine'
"
"> Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " https://github.com/fatih/vim-go

call plug#end()

"****************** ident ***************
let g:indentLine_setColors = 0

"************ lsp ************************

  nnoremap <leader>gd: lua vim.lsp.buf.definition()<CR>
  nnoremap <leader>gi lua vim.lsp.buf.implementation()<CR>

"************** nerdtree **************************


" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') &&b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


"********** closetag *****************************

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'




"************** ultisnips *******************************


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<s-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
let g:UltiSnipsEditSplit="vertical"


"******** colorScheme ********************

colorscheme dracula
highlight Normal guibg=none




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocomplete

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
"set shortmess+=c


" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'UltiSnips'


let g:completion_enable_auto_hover = 1


let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


"let g:completion_trigger_keyword_length = 2 " default = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" treesitter hightligth

lua require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF


"*********** map (atajos teclado) ****************************
let mapleader=" "
"Maps (leader)
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sc :set spell!<cr>

"(R)eplace all
nnoremap <leader>r yiw:%s/\<<C-r>"\>//gc<left><left><left>
"reemplaza todas las coincidencias de la palabra en el mouse por lo ingresado

" Usar <líder> + y para copiar al portapapeles
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Usar <líder> + d para cortar al portapapeles
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Usar <líder> + p para pegar desde el portapapeles
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" Moverse al buffer siguiente con <líder> + l
nnoremap <leader>l :bnext<CR>

" Moverse al buffer anterior con <líder> + j
nnoremap <leader>j :bprevious<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"** nerdtree
"
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

nnoremap <leader>nt :NERDTreeFind<CR>
nnoremap <leader>nq :NERDTreeToggle<CR>




augroup myAutogroup
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e " Removes trailing whitespace.
augroup END


