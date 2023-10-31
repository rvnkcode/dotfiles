-- https://github.com/tjtrabue/dotfiles/blob/414a1e277324ba6f8b8c37a22f0825abf32b3f02/link/config/nvim/plug-config/formatter.config.lua#L93
local function formatter_sql_formatter()
  return {
    exe = "sql-formatter",
    stdin = true,
  }
end

-- TODO: Install formatter :Mason
return {
  {
    -- https://github.com/mhartington/formatter.nvim
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite" },
    config = function()
      require("formatter").setup({
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          css = {
            require("formatter.filetypes.css").prettier,
          },
          sql = {
            formatter_sql_formatter,
          },
        },
      })
    end,
  },
}
