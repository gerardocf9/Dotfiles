
--*****************************************************************************
--      Abbreviations
--*****************************************************************************
-- no one is really happy until you have this shortcuts
vim.cmd([[
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
]])


--*********** map (atajos teclado) ****************************
local keymap = function(tbl)
	-- Some sane default options
	local opts = { noremap = true, silent = true }
	-- Dont want these named fields on the options table
	local mode = tbl['mode']
	tbl['mode'] = nil
	local bufnr = tbl['bufnr']
	tbl['bufnr'] = nil

	for k, v in pairs(tbl) do
		if tonumber(k) == nil then
			opts[k] = v
		end
	end


	if bufnr ~= nil then
		vim.api.nvim_buf_set_keymap(bufnr, mode, tbl[1], tbl[2], opts)
	else
		vim.api.nvim_set_keymap(mode, tbl[1], tbl[2], opts)
	end
end

local nmap = function(tbl)
	tbl['mode'] = 'n'
	keymap(tbl)
end

local imap = function(tbl)
	tbl['mode'] = 'i'
	keymap(tbl)
end

--Maps (leader)

nmap{"<leader>ev", "<cmd>edit $MYVIMRC<cr>"}
nmap{"<leader>sv","<cmd>source $MYVIMRC<cr>"}
nmap{"<leader>sc", "<cmd>set spell!<cr>"}

--(R)eplace all
--vim.cmd('nnoremap <leader>r yiw:%s/\<<C-r>"\>//gc<left><left><left>')
--reemplaza todas las coincidencias de la palabra en el mouse por lo ingresado

-- Usar <líder> + y para copiar al portapapeles
--vnoremap <leader>y "+y
--nmap{"<leader>y "+y

-- Usar <líder> + d para cortar al portapapeles
--vnoremap <leader>d "+d
--nmap{"<leader>d "+d

-- Usar <líder> + p para pegar desde el portapapeles
--nmap{"<leader>p "+p
--vnoremap <leader>p "+p
--nmap{"<leader>P "+P
--vnoremap <leader>P "+P

--" Moverse al buffer siguiente con <líder> + l
nmap{"<leader>l","<cmd>bnext<CR>"}

--" Moverse al buffer anterior con <líder> + j
nmap{"<leader>j","<cmd>bprevious<CR>"}

--" Cerrar el buffer actual con <líder> + q
nmap{"<leader>q","<cmd>bdelete<CR>"}


-- open tree
nmap{"<leader>nt","<cmd>NvimTreeFocus<CR>"}
--:NvimTreeFocus Open the tree if it is closed, and then focus on the tree.
--
-- toqle tree
nmap{"<leader>nq","<cmd>NvimTreeToggle<CR>"}
--:NvimTreeToggle Open or close the tree. Takes an optional path argument.
--
--:NvimTreeCollapse Collapses the nvim-tree recursively.

-- ----------------------------------
--      TODO
-- list TodoQuickFix
nmap{"<leader>tdq","<cmd>TodoQuickFix<CR>"}

-- list TodoTelescope
nmap{"<leader>tdt","<cmd>TodoTelescope<CR>"}
