-- ref:https://github.com/Srivatsan260/.dotfiles_v2/blob/29a728a10b63f62303114d5dbc0a0ce269f9b498/nvim/lua/plugins/linter.lua#L2
return {
  {
    -- https://github.com/mfussenegger/nvim-lint
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      local linters = lint.linters

      lint.linters_by_ft = {
        sql = { "sqlfluff" },
        markdown = { "markdownlint" },
      }

      linters.sqlfluff.args = { "lint", "--format=json", "--dialect=sqlite" }
      linters.markdownlint.args = { "--disable", "MD013", "MD024", "MD026", "--" }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("LintGroup", { clear = true }),
        callback = function()
          lint.try_lint()
          lint.try_lint("codespell")
        end,
      })
    end,
  },
}
