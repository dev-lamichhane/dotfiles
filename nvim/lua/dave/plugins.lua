return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- keep plugins in line. IDK TBH
  use 'nvim-lua/plenary.nvim' 

  -- nerdtree
  use 'preservim/nerdtree'

  -- commentary
  use 'numToStr/comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- nightfly colorscheme
  use 'bluz71/vim-nightfly-guicolors'

  -- lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  })

  -- treesitter and colored brackets
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require('nvim-treesitter.install').update({with_sync = true})
    end,
  })

  -- vim surround
  use 'tpope/vim-surround'

  -- git
  use 'lewis6991/gitsigns.nvim'

  --github copilot
  use 'github/copilot.vim'

  -- LSP and Completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- lua snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Mason for installing lsp servers
  use "williamboman/mason.nvim" 

  -- autopairs
  use 'windwp/nvim-autopairs'

  -- prettier
  use 'prettier/vim-prettier'
end)
