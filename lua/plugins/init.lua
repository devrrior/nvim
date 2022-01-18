local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost init.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "moll/vim-bbye"
  use "antoinemadec/FixCursorHold.nvim"
  use {
    "windwp/nvim-autopairs",
    config = "require'plugins.config.autopairs'",
    after = "nvim-cmp"
  }
  use {
    "numToStr/Comment.nvim",
    config = "require'plugins.config.comment'"
  }
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = "require'plugins.config.nvim-tree'",
    cmd = "NvimTreeToggle"
  }
  use {
    "akinsho/toggleterm.nvim",
    config = "require'plugins.config.toggleterm'",
    cmd = "ToggleTerm",
  }
  use {
    "ahmedkhalf/project.nvim",
    config = "require'plugins.config.project'"
  }
  use {
    "lewis6991/impatient.nvim",
    config = "require'plugins.config.impatient'"
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = "require'plugins.config.identline'",
    event = "BufRead"
  }
  use {
    "kyazdani42/nvim-web-devicons",
    config = "require'plugins.config.icons'",
  }

  -- Coloscheme
  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
        vim.o.background = "dark"
        vim.g.gruvbox_contrast_dark = "hard"
        vim.cmd([[colorscheme gruvbox]])
    end
  }

  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp", -- The completion plugin
    config = "require'plugins.config.cmp'"
  }
  use {
    "hrsh7th/cmp-buffer", -- buffer completions
    after = "nvim-cmp"
  }
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use {
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    after = "LuaSnip"
  }
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use {
    "L3MON4D3/LuaSnip", --snippet engine
    after = "nvim-cmp",
  }
  use {
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    event = "InsertEnter",
    after = "nvim-cmp",
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig", -- enable LSP
    event = "BufRead",
    config = "require'plugins.config.lsp'",
  }
  use {
    "williamboman/nvim-lsp-installer",
    cmd = "LspInstallInfo"
  } -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    -- event = "BufRead",
    run = ":TSUpdate",
    config = "require'plugins.config.whichkey'",
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter"
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    cmd = "Telescope",
    config = "require'plugins.config.telescope'"
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = "require'plugins.config.gitsigns'"
  }

  use {"ThePrimeagen/vim-be-good"}

  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
