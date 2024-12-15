local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)

-- LSP
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Code Action
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<CR>", opts) -- Format
keymap("n", "<leader>lh", "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<CR>", opts) -- Hints
keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts) -- Info
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts) -- Next diagnostic
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts) -- Prev diagnostic
keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", opts) -- CodeLens action
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) -- Quickfix
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Rename

-- Telescope
keymap("n", "<leader>bb", "<cmd>Telescope buffers previewer=false<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope git_branches<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<CR>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", opts)

-- Neogit
keymap("n", "<leader>gg", "<cmd>Neogit<CR>", opts)

-- Bufferline
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>c", "<cmd>bd<CR>", opts)
