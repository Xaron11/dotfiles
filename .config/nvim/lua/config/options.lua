-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false -- disable autoformatting on save

-- vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.clipboard = "" -- don't use system clipboard
vim.opt.autoread = true -- automatically read files changed outside of Vim

vim.g.ai_cmp = false -- disable copilot suggestions in completion menu
vim.g.copilot_no_tab_map = true -- disable copilot tab mapping
vim.g.copilot_lsp_settings = { -- disable copilot telemetry
  telemetry = {
    telemetryLevel = "off",
  }
}

vim.g.vimtex_view_method = 'zathura'
