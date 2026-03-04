return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,

      patterns = { ".git", "Makefile", "package.json", "go.mod", "Cargo.toml", "pyproject.toml", "requirements.txt", "CMakeLists.txt", "stylua.toml" },

      exclude_dirs = { "**/node_modules/*", "**/target/*", "**/dist/*", "**/.venv/*", "**/build/*" },

      silent_chdir = false,

      scope_chdir = "tab",
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
}
