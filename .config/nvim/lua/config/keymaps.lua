-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Git log
vim.keymap.del("n", "<leader>gL")
vim.keymap.set("n", "<leader>gL", function()
  Snacks.picker.git_log({ cwd = vim.fn.getcwd() })
end, { desc = "Git Log (cwd*)" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<Up>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Down>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Left>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { silent = true })
