return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        robot = { "robocop" },
      },
      formatters = {
        robocop = {
          -- Specify the command and its arguments for formatting
          command = "robocop",
          args = { "format", "$FILENAME"  },
          stdin = false,
        },
      },
    },
  },
}
