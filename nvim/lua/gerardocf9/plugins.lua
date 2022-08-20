local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    -- REQUIRED
    use 'wbthomason/packer.nvim'

    -- native lsp
    use 'neovim/nvim-lspconfig'
  --  use { 'tjdevries/lsp_extensions.nvim' }
    -- vim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
    use { 'nvim-treesitter/playground' }

    -- theme
    use {'dracula/vim', as='dracula'}
    -- line
    use {'kyazdani42/nvim-web-devicons'}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- LuaSnip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Auto pair
    use { 'jiangmiao/auto-pairs' }
    -- Clossing tabs
    use { 'alvan/vim-closetag' }

    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        }
    }
    --Snippets
    -- Track the engine.
    use {
        'SirVer/ultisnips',
        requires = {
            'honza/vim-snippets'
        }
    }

  if packer_bootstrap then
    require('packer').sync()
  end
end)


--ident
-- Plug 'Yggdroot/indentLine'

-- Go
-- Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " https://github.com/fatih/vim-go

