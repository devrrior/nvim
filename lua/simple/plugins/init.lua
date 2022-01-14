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

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

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
  use { "windwp/nvim-autopairs", config = "require'simple.plugins.config.autopairs'" }
  use { "numToStr/Comment.nvim", config = "require'simple.plugins.config.comment'" }
  use "kyazdani42/nvim-web-devicons"
  use { "kyazdani42/nvim-tree.lua", config = "require'simple.plugins.config.nvim-tree'" }
  use { "akinsho/bufferline.nvim", config = "require'simple.plugins.config.bufferline'" }
  use "moll/vim-bbye"
  use { "nvim-lualine/lualine.nvim", config = "require'simple.plugins.config.lualine'" }
  use { "akinsho/toggleterm.nvim", config = "require'simple.plugins.config.toggleterm'" }
  use { "ahmedkhalf/project.nvim", config = "require'simple.plugins.config.project'" }
  use { "lewis6991/impatient.nvim", config = "require'simple.plugins.config.project'" }
  use { "lukas-reineke/indent-blankline.nvim", config = "require'simple.plugins.config.identline'" }
  use { "goolord/alpha-nvim", config = "require'simple.plugins.config.alpha'" }
  use "antoinemadec/FixCursorHold.nvim" -- Optional
  use {"folke/which-key.nvim", config = "require'simple.plugins.config.whichkey'" }

  -- Coloscheme
  use {
    "Mofiqul/vscode.nvim",
    config =  function()
      vim.g.vscode_style = "dark"
      vim.cmd('colorscheme vscode')
    end

  }

  -- Autocompletion
  use { 'hrsh7th/nvim-cmp', config="require'simple.plugins.config.cmp'" }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

-- LSP
  use { "neovim/nvim-lspconfig", config = "require'simple.plugins.config.lsp'" } -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = "require'simple.plugins.config.whichkey'",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Telescope
  use { "nvim-telescope/telescope.nvim", config = "require'simple.plugins.config.telescope'" }

  -- Git
  use { "lewis6991/gitsigns.nvim", config = "require'simple.plugins.config.gitsigns'" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
