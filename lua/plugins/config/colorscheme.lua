-- vim.g.gruvbox_contrast_dark = 'hard'
-- vim.cmd([[colorscheme gruvbox]])

-- Lua
-- chris
vim.g.transparent_background = true        -- transparent background(Default: false)
vim.g.italic_comments = true               -- italic comments(Default: true)
vim.g.italic_keywords = true               -- italic keywords(Default: true)
vim.g.italic_functions = true              -- italic functions(Default: false)
vim.g.italic_variables = true              -- italic variables(Default: false)
vim.cmd([[colorscheme darkplus]])


-- Example config in Lua
-- require("onedark").setup({
--   functionStyle = "italic",
--   sidebars = {"qf", "vista_kind", "terminal", "packer"},
--
--   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--   colors = {hint = "orange", error = "#ff0000"}
-- })

-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
--
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
--
-- vim.cmd[[colorscheme tokyonight]]



-- Lua
-- require('onedark').setup  {
--     -- Main options --
--     style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--     transparent = false,  -- Show/hide background
--     term_colors = true, -- Change terminal color as per the selected theme style
--     ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--     -- toggle theme style ---
--     toggle_style_key = '<leader>ts', -- Default keybinding to toggle
--     toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
--
--     -- Change code style ---
--     -- Options are italic, bold, underline, none
--     -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--     code_style = {
--         comments = 'italic',
--         keywords = 'italic',
--         functions = 'none',
--         strings = 'italic',
--         variables = 'none'
--     },
--
--     -- Custom Highlights --
--     colors = {}, -- Override default colors
--     highlights = {}, -- Override highlight groups
--
--     -- Plugins Config --
--     diagnostics = {
--         darker = true, -- darker colors for diagnostic
--         undercurl = true,   -- use undercurl instead of underline for diagnostics
--         background = true,    -- use background color for virtual text
--     },
-- }
--
-- require('onedark').load()
--
