-- ref:https://github.com/Srivatsan260/.dotfiles_v2/blob/29a728a10b63f62303114d5dbc0a0ce269f9b498/nvim/lua/plugins/linter.lua#L2
return {
  -- https://github.com/mfussenegger/nvim-lint
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- TODO: Install linter :Mason
    lint.linters_by_ft = {
      sql = { "sqlfluff" },
    }

    local sqlfluff = lint.linters.sqlfluff
    sqlfluff.args = { "lint", "--format=json", "--dialect=sqlite" }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("LintGroup", { clear = true }),
      pattern = { "*.sql" },
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
