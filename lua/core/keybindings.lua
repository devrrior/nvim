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
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

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

-- Telescope --
keymap('n', '<Leader>f', ':lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown{previewer = false})<cr>', opts)
keymap('n', '<Leader>t', ':Telescope live_grep theme=ivy<cr>', opts)
keymap('n', '<Leader>p', ':lua require("telescope").extensions.projects.projects()<cr>', opts)
keymap('n', '<Leader>b', ':Telescope buffers<cr>', opts)

-- Remove buffer --
keymap('n', '<Leader>c', ':Bdelete<cr>', opts)

-- Comment --
keymap('n', '<Leader>/', ':lua require("Comment.api").toggle_current_linewise()<cr>', opts)
keymap('v', '<Leader>/', '<ESC>:lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- No Highlight --
keymap('n', '<Leader>h', ':nohlsearch<CR>', opts)

-- LSP --
keymap('n', '<Leader>lf', ':lua vim.lsp.buf.formatting()<cr>', opts)
keymap('n', '<Leader>lq', ':lua vim.diagnostic.setloclist()<cr>', opts)
keymap('n', '<C-\\>', ':ToggleTerm direction=float<cr>', opts)

-- Goto declaration --
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)

-- Explore --
keymap('n', '<Leader>e', ':NvimTreeToggle<cr>', opts)


-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
