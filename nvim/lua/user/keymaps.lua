local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Move im splits with Vim nav
keymap("n", "<leader>h", ":wincmd h<CR>", opts)
keymap("n", "<leader>j", ":wincmd j<CR>", opts)
keymap("n", "<leader>k", ":wincmd k<CR>", opts)
keymap("n", "<leader>l", ":wincmd l<CR>", opts)

-- Remap <Esc> to jj to make it easier to re-enter command mode
keymap("i", "jj", "<ESC>", opts)

-- Make yank behave like C, D, etc 
keymap("n","Y", "y$", opts)

------ Keep cursor centered
--keymap("n", "n", "nzzzv", opts)
--keymap("n", "N", "Nzzzv", opts)
--keymap("n", "J", "mzJ`z", opts)

-- Moving text
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("i", "<C-j>", "<C-O>:m .+1<CR><C-O>==", opts)
keymap("i", "<C-k>", "<C-O>:m .-2<CR><C-O>==", opts)
keymap("n", "<leader>j", ":m .+1<CR>==", opts)
keymap("n", "<leader>k", ":m .-2<CR>==", opts)

-- yank and paste to clipboard registers with leader key
keymap("v", "<leader>y", "\"*y", opts )
keymap("n", "<leader>p", "\"*p", opts )

-- Toggle NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

