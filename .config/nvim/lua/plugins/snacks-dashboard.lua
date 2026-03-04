return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "F", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "o", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "r", desc = "Restore Session", action = require("persistence").load },
          { icon = " ", key = "R", desc = "Restore Last Session", action = function() require("persistence").load({ last = true }) end },
          { icon = "S", key = "S", desc = "Select Session", action = require("persistence").select },
          {
            icon = "P",
            key = "P",
            desc = "Projects (Tab)",
            action = function()
              Snacks.picker.projects({
                confirm = function(picker, item)
                  picker:close()
                  if item.file then
                    vim.cmd("tabnew")
                    vim.cmd("tcd " .. item.file)
                  end
                end,
                dev = { "~/Repos" },
                patterns = {
                  ".git",
                  "Makefile",
                  "package.json",
                  "go.mod",
                  "Cargo.toml",
                  "pyproject.toml",
                  "requirements.txt",
                  "CMakeLists.txt",
                  "stylua.toml",
                },
              })
            end,
          },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
