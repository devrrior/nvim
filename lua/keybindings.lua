local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


keymap('n', ',p', '"0p', {})
keymap('n', ',P', '"0P', {})

-- Split window
keymap('n', 'vs', ':vs<CR>', opts)
keymap('n', 'sp', ':sp<CR>', opts)

-- Replace word
keymap('n', '<C-S>', ':%s/', { noremap = true })

-- Explore --
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- Comment
keymap('n', '<Leader>/', ':lua require("Comment.api").toggle_current_linewise()<CR>', opts)
keymap('v', '<Leader>/', ':lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- Delete buffer
keymap('n', '<Leader>c',':Bdelete!<CR>',opts)

-- Telescope
keymap('n', '<C-P>', ':Telescope find_files<CR>', opts)
keymap('n', '<C-F>', ':Telescope live_grep<CR>', opts)
keymap('n', '<C-B>', ':Telescope buffers<CR>', opts)
keymap('n', '<C-T>', ':lua require("telescope").extensions.git_worktree.git_worktrees(require("telescope.themes").get_ivy({}))<CR>', opts)

-- Terminal
keymap('n', '<Leader>g', ':lua _LAZYGIT_TOGGLE()<CR>', term_opts)

-- QuickFix
-- keymap('n', '<Leader>l', ':lua vim.diagnostic.setloclist()<CR>', opts)

-- Go to preview
-- keymap('n', 'gp', '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', opts)
-- keymap('n', 'gi', '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', opts)
-- keymap('n', 'gP', '<cmd>lua require("goto-preview").close_all_win()<CR>', opts)
-- Only set if you have telescope installed
-- keymap('n', 'gr', '<cmd>lua require("goto-preview").goto_preview_references()<CR>', opts )

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
vim.cmd [[ command! Isort execute '!isort %' ]]
