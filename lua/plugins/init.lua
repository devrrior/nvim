local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
	use({
		"lewis6991/impatient.nvim",
	})

	use({ "wbthomason/packer.nvim" })

	use({
		"kyazdani42/nvim-web-devicons",
		config = [[require'plugins.config.icons']],
	})

	use({ "moll/vim-bbye" })

	use({
		"windwp/nvim-autopairs",
		config = [[require'plugins.config.autopairs']],
		after = "nvim-cmp",
	})

	use({
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	})

	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = true, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = [[require'plugins.config.comment']],
	})

	use({
		"tpope/vim-surround",
		keys = { "c", "d", "y" },
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require'plugins.config.indentline']],
	})

	-- Colorscheme
	-- use {
	--   'ellisonleao/gruvbox.nvim',
	--   config = function ()
	--     vim.g.gruvbox_contrast_dark = "hard"
	--     vim.g.gruvbox_italic = true
	--     -- vim.g.gruvbox_italicize_strings = true
	--     vim.cmd([[
	--       colorscheme gruvbox
	--     ]])
	-- vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
	--   end
	-- }
	use({
		"LunarVim/darkplus.nvim",
		config = function()
			vim.cmd([[
      colorscheme darkplus
    ]])
		end,
	})
	-- use {
	--   'folke/tokyonight.nvim',
	--   config = function ()
	--     vim.g.tokyonight_style            = "night"
	--     vim.g.tokyonight_italic_functions	= true
	--     vim.g.tokyonight_italic_keywords	= true
	--     vim.cmd([[
	--       colorscheme tokyonight
	--     ]])
	--   end
	-- }

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		run = ":TSUpdate",
		config = [[require'plugins.config.treesitter']],
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		after = "nvim-treesitter",
	})
	use({
		"windwp/nvim-ts-autotag",
		event = "BufRead",
	})

	-- Nvim Tree
	use({
		"kyazdani42/nvim-tree.lua",
		config = [[require'plugins.config.nvim-tree']],
		cmd = "NvimTreeToggle",
	})

	-- Bufferline
	use({
		"akinsho/bufferline.nvim",
		config = [[require'plugins.config.bufferline']],
		event = "BufWinEnter",
	})

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		config = [[require'plugins.config.lualine']],
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		cmd = "Telescope",
		config = [[require"plugins.config.telescope"]],
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		-- event="BufRead"
	})

	use({
		"ThePrimeagen/git-worktree.nvim",
	})

	-- cmp plugins
	use({
		"hrsh7th/nvim-cmp", -- The completion plugin
		config = [[require'plugins.config.cmp']],
		-- event = 'InsertEnter'
	})
	use({
		"hrsh7th/cmp-buffer", -- buffer completions
		-- after = "nvim-cmp"
	})
	use({
		"hrsh7th/cmp-path", -- path completions
		-- after = "nvim-cmp"
	})
	use({
		"hrsh7th/cmp-cmdline", -- cmdline completions
		-- after = "nvim-cmp"
	})
	use({
		"saadparwaiz1/cmp_luasnip", -- snippet completions
		-- after = "LuaSnip"
	})
	use("hrsh7th/cmp-nvim-lsp")

	-- LSP
	use({
		"neovim/nvim-lspconfig", -- enable LSP
		event = "BufRead",
		config = [[require'plugins.config.lsp']],
	})
	use({
		"williamboman/nvim-lsp-installer", -- simple to use language server installer
		even = "InsertEnter",
	})
	use({
		"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
		event = "InsertEnter",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
		-- event = "InsertEnter",
	})
	-- snippets
	use({
		"L3MON4D3/LuaSnip", --snippet engine
		-- event = "InsertEnter",
	})
	use({
		"rafamadriz/friendly-snippets", -- a bunch of snippets to use
		-- event = "InsertEnter",
	})

	-- COC
	-- use {
	--   'neoclide/coc.nvim',
	--   branch = 'release',
	--   config = 'require"plugins.config.coc"',
	-- }

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = [[require'plugins.config.gitsigns']],
	})

	use({ "ThePrimeagen/vim-be-good" })

	-- UI for rename
	use({ "stevearc/dressing.nvim" })

	-- toggleterm
	use({
		"akinsho/toggleterm.nvim",
		config = [[require'plugins.config.toggleterm']],
	})

	-- LSP Signature
	use({
		"ray-x/lsp_signature.nvim",
		config = [[require'plugins.config.lsp-signature']],
	})

	-- Github Compilot
	use({
		"github/copilot.vim",
		config = function()
			vim.cmd([[
        imap <silent><script><expr> <C-L> copilot#Accept()
        let g:copilot_no_tab_map = v:true
      ]])
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
