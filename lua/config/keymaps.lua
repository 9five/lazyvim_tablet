-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Neotree
map("n", "<C-n>", ":Neotree toggle<CR>")

-- Buffer
map("n", "<Tab>", "<cmd>bnext<cr>")
map("n", "<S-Tab>", "<cmd>bprev<cr>")
map("n", ";c", function()
    Snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- Split window
map("n", "ss", ":split<Return><C-w>w")
map("n", "sv", ":vsplit<Return><C-w>w")

-- Resize window
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><right>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

-- Telescope
map("n", ";f", LazyVim.pick("files"), { desc = "Find File" })
map("n", ";r", LazyVim.pick("live_grep"), { desc = "Grep" })

-- Terminal
map("n", "<C-4>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Toggle Terminal" })
map("t", "<C-4>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Diagnostics
map("n", "<C-,>", vim.diagnostic.goto_next)
map("n", "<C-.>", vim.diagnostic.goto_prev)

-- Plugins
map("n", ";s", ":Spectre<CR>", { desc = "Spectre" })
map("n", ";d", ":lua require('dbee').open()<CR>", { desc = "Dbee" })
map("n", ";g", function()
    Snacks.lazygit({ size = { width = 1.0, height = 1.0 }, esc_esc = true, cwd = LazyVim.root.get() })
end, { desc = "LazyGit" })

-- Delete Default Keymaps
vim.keymap.del("n", ";")
vim.keymap.del("n", "s")
