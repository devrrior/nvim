local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = 'rounded' }
    end,
  },
}

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use 'moll/vim-bbye'

  use {
    "windwp/nvim-autopairs",
    config = "require'plugins.config.autopairs'",
    after = "nvim-cmp"
  }

  use {
    'numToStr/Comment.nvim',
    config = 'require"plugins.config.comment"'
  }

  use {
    'lewis6991/impatient.nvim',
    config = 'require"plugins.config.impatient"',
  }

  use {
    'blackCauldron7/surround.nvim',
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }

  -- Colorscheme
  use {
    'ellisonleao/gruvbox.nvim',
    config = function ()
      vim.g.gruvbox_contrast_dark = "hard"
      vim.cmd([[
        colorscheme gruvbox
      ]])
    end
  }
  --
  -- use {
  --   'folke/tokyonight.nvim',
  --   config = function ()
  --     vim.cmd([[
  --       colorscheme tokyonight
  --     ]])
  --   end
  -- }
  -- use {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   config = "require'plugins.config.colorscheme'"
  -- }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    run = ":TSUpdate",
    config = "require'plugins.config.treesitter'",
  }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    after = "nvim-treesitter",
  }

  -- Nvim Tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = "require'plugins.config.nvim-tree'",
    cmd = "NvimTreeToggle"
  }

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = "require'plugins.config.bufferline'",
    event = "BufWinEnter"
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = 'require"plugins.config.lualine"',
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    cmd = 'Telescope',
    config = 'require"plugins.config.telescope"',
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'ThePrimeagen/git-worktree.nvim',
  }

  -- cmp plugins
  use {
    'hrsh7th/nvim-cmp', -- The completion plugin
    config = "require'plugins.config.cmp'",
    event = 'InsertEnter'
  }
  use {
    'hrsh7th/cmp-buffer', -- buffer completions
    after = "nvim-cmp"
  }
  use {
    'hrsh7th/cmp-path', -- path completions
    after = "nvim-cmp"
  }
  use {
    "hrsh7th/cmp-cmdline", -- cmdline completions
    after = "nvim-cmp"
  }
  use {
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    -- after = "LuaSnip"
  }
  use "hrsh7th/cmp-nvim-lsp"

  -- LSP
  use {
    "neovim/nvim-lspconfig", -- enable LSP
    event = "BufRead",
    config = "require'plugins.config.lsp'",
  }
  use {
    'williamboman/nvim-lsp-installer', -- simple to use language server installer
    even = 'InsertEnter'
  }
  use {
    'tamago324/nlsp-settings.nvim', -- language server settings defined in json for
    event = "InsertEnter",
  }
  use {
    'jose-elias-alvarez/null-ls.nvim', -- for formatters and linters
    event = "InsertEnter",
  }
  -- snippets
  use {
    "L3MON4D3/LuaSnip", --snippet engine
    -- event = "InsertEnter",
  }
  use {
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    -- event = "InsertEnter",
  }

  use {
    "kyazdani42/nvim-web-devicons",
    config = "require'plugins.config.icons'"
  }

  -- COC
  -- use {
  --   'neoclide/coc.nvim',
  --   branch = 'release',
  --   config = 'require"plugins.config.coc"',
  -- }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = "require'plugins.config.gitsigns'"
  }

  use {'ThePrimeagen/vim-be-good'}

  -- config = {
  --   -- Move to lua dir so impatient.nvim can cache it
  --   compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  -- }
  --

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
