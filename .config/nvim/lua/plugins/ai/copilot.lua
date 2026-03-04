return {
  { "zbirenbaum/copilot-cmp", enabled = false },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        -- hide_during_completion = true,
        -- auto_trigger = false,
        keymap = {
          accept = "<C-J>",
          accept_line = "<C-j>",
          dismiss = "<C-k>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        ["*"] = true,
      },
    },
  },
}
