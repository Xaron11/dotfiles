return {
  { "zbirenbaum/copilot-cmp", enabled = false },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        -- hide_during_completion = false,
        -- auto_trigger = true,
        keymap = {
          accept = "<C-j>",
          -- accept_word = "<C-J>",
          dismiss = "<C-k>",
          -- next = "<M-]>",
          -- prev = "<M-[>",
        },
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        ["*"] = true,
      },
      -- This disables full-line completions
      -- copilot_node_command = "node", -- Ensure node is set correctly
      server_opts_overrides = {
        settings = {
          telemetry = {
            telemetryLevel = "off", -- Disable telemetry
          },
          -- advanced = {
          --   listCount = 1, -- Only show one suggestion
          --   inlineSuggest = true,
          --   disableAutoCompletions = false,
          --   disableFullLineCompletions = true,
          -- },
        },
      },
    },
  },
}
