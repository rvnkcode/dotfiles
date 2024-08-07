return {
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = "TSInstallInfo",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "comment",
          "cpp",
          "css",
          "csv",
          "diff",
          "dockerfile",
          "git_config",
          "git_rebase",
          "gitcommit",
          "gitignore",
          "html",
          "http",
          "java",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "markdown",
          "prisma",
          "query",
          "regex",
          "rust",
          "scss",
          "sql",
          "ssh_config",
          "svelte",
          "todotxt",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
        sync_install = false,
      })
    end,
  },
  {
    -- https://github.com/windwp/nvim-ts-autotag/issues/64
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup({
        enable = true
      })
    end,
  },
}
