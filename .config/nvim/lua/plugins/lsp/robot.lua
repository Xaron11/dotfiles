return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- robotframework-lsp will be automatically installed with mason and loaded with lspconfig
      robotframework_ls = {},
    },
    -- optional: custom setup to add pythonpath
    setup = {
      robotframework_ls = function(_, opts)
        -- customize pythonpath for your project
        opts.settings = {
          robot = {
            pythonpath = { vim.fn.getcwd(), vim.fn.getcwd() .. "/.venv", vim.fn.getcwd() .. "/.venv/lib/python3.13/site-packages" },
          },
        }
        require("lspconfig").robotframework_ls.setup(opts)
        return true
      end,
    },
  },
}
