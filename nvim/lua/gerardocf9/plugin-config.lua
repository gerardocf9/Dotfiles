    -- treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "python" },
    sync_install = false,
    highlight = {
        enable = true,
        auto_install = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            scope_incremental = "grc",
            node_incremental = "n",
            node_decremental = "m",
        },
    },
    indent = {
        enable = true
    }
}

    -- theme
vim.cmd('colorscheme dracula')

    -- line
require('lualine').setup {
  options = { theme  = 'dracula' },
}

    -- telescope
vim.cmd([[
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
]])

    -- LuaSnip
--    agregados en el nativbe LSP
--    use 'L3MON4D3/LuaSnip'
--    use 'saadparwaiz1/cmp_luasnip'

    -- Auto pair
--    use { 'jiangmiao/auto-pairs' }

    -- Clossing tabs
--" filenames like *.xml, *.html, *.xhtml, ...
--" These are the file extensions where this plugin is enabled.

vim.cmd([[
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ 'typescriptreact': 'jsxRegion,tsxRegion',
\ 'javascriptreact': 'jsxRegion',
\ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
]])

--" Add > at current position without closing the current tag, default is ''
--let g:closetag_close_shortcut = '<leader>>'


    -- nvim-tree
-- empty setup using defaults
require("nvim-tree").setup()
-- en keybinds



