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
    config = "require'plugins.config.colorscheme'"
  }

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
    cmd = 'Telescope',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = 'require"plugins.config.telescope"',
  }
  use {
    'ThePrimeagen/git-worktree.nvim',
  }

  -- COC
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = 'require"plugins.config.coc"',
  }

  -- Git
  -- use {
  --   "lewis6991/gitsigns.nvim",
  --   event = "BufRead",
  --   config = "require'plugins.config.gitsigns'"
  -- }

  use {'ThePrimeagen/vim-be-good'}

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
