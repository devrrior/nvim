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
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "moll/vim-bbye"
  use "antoinemadec/FixCursorHold.nvim"
  use {
    "windwp/nvim-autopairs",
    config = "require'simple.plugins.config.autopairs'",
    after = "nvim-cmp"
  }
  use {
    "numToStr/Comment.nvim",
    config = "require'simple.plugins.config.comment'"
  }
  use {
    "kyazdani42/nvim-tree.lua",
    config = "require'simple.plugins.config.nvim-tree'",
    cmd = "NvimTreeToggle"
  }
  use {
    "akinsho/bufferline.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = "require'simple.plugins.config.bufferline'",
    event = "BufWinEnter"
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = "require'simple.plugins.config.lualine'",
    event = "BufWinEnter"
  }
  use {
    "akinsho/toggleterm.nvim",
    config = "require'simple.plugins.config.toggleterm'"
  }
  use {
    "ahmedkhalf/project.nvim",
    config = "require'simple.plugins.config.project'"
  }
  use {
    "lewis6991/impatient.nvim",
    config = "require'simple.plugins.config.impatient'"
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = "require'simple.plugins.config.identline'",
    event = "BufRead"
  }
  use {
    "goolord/alpha-nvim",
    config = "require'simple.plugins.config.alpha'"
  }
  use {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = "require'simple.plugins.config.whichkey'"
  }
  -- use { "folke/which-key.nvim", config = "require'simple.plugins.config.whichkey'"}


  -- Coloscheme
  use {
    "Mofiqul/vscode.nvim",
    config =  function()
      vim.g.vscode_style = "dark"
      vim.cmd('colorscheme vscode')
    end

  }

  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp", -- The completion plugin
    config = "require'simple.plugins.config.cmp'"
  }
  use {
    "hrsh7th/cmp-buffer", -- buffer completions
    after = "nvim-cmp"
  }
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use {
    "neovim/nvim-lspconfig", -- enable LSP
    config = "require'simple.plugins.config.lsp'",
    event = "BufRead",
  }
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufWinEnter",
    run = ":TSUpdate",
    config = "require'simple.plugins.config.whichkey'",
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
    config = "require'simple.plugins.config.telescope'"
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = "require'simple.plugins.config.gitsigns'"
  }

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
