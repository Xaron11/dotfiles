return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects({
          confirm = function(picker, item)
            picker:close()
            if item.file then
              local path = item.file
              vim.cmd("tabnew")
              vim.cmd("tcd " .. path)
              -- Optional: Open a file picker immediately in the new tab
              -- require("mini.files").open(path, true)
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
      desc = "Projects (New Tab)",
    },
  },
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
        explorer = {
          hidden = true,
        },
      },
      previewers = {
        diff = {
          builtin = true, -- use Neovim for previewing diffs (true) or use an external tool (false)
          -- cmd = {"sh", "-c", "git diff \"$@\" | diff-so-fancy"},
        },
        git = {
          builtin = true, -- use Neovim for previewing git output (true) or use git (false)
          args = {},
        },
      },
      win = {
        input = {
          keys = {
            ["<c-t>"] = { "tab_tcd", mode = { "i", "n" } },
          },
        },
      },
      actions = {
        tab_tcd = function(picker, item)
          picker:close()
          if item.file then
            vim.cmd("tabnew")
            vim.cmd("tcd " .. item.file)
          end
        end,
      },
    },
    explorer = {
      replace_netrw = false,
      files = {
        hidden = true,
        ignored = true,
      },
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
