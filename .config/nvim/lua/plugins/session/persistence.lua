return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    options = vim.opt.sessionoptions:get(),
    -- dir = vim.fn.getcwd(),
    need = 1,
    branch = false,
  },
  keys = {
    {
      "<leader>qd",
      function()
        require("persistence").stop()
        vim.notify("Session saving disabled for this instance", vim.log.levels.INFO, { title = "Persistence" })
      end,
      desc = "Don't Save Current Session",
    },
  },
}
