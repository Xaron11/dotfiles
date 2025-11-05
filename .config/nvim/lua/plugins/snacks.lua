return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      files = {
        hidden = true,
        ignored = true,
      },
      previewers = {
        diff = {
          builtin = true, -- use Neovim for previewing diffs (true) or use an external tool (false)
          -- cmd = {"sh", "-c", "git diff \"$@\" | diff-so-fancy"},
        },
        git = {
          builtin = true, -- use Neovim for previewing git output (true) or use git (false)
          args = { }
        },
      }
    },
    explorer = {
      files = {
        hidden = true,
        ignored = true,
      },
    },
  },
}
