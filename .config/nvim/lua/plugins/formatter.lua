-- https://github.com/tjtrabue/dotfiles/blob/414a1e277324ba6f8b8c37a22f0825abf32b3f02/link/config/nvim/plug-config/formatter.config.lua#L93
local function formatter_rust()
  return {
    exe = "rustfmt",
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
          rust = {
            formatter_rust,
          },
          markdown = {
            require("formatter.filetypes.markdown").prettier,
          },
          -- https://github.com/claby2/dotfiles/blob/1944631d1c456b6730901cfbcebdf3e92339abb4/.config/nvim/lua/plugins.lua#L138
          astro = {
            function()
              return {
                exe = "npx",
                args = {
                  "prettier",
                  "--stdin-filepath",
                  vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                  "--plugin=prettier-plugin-astro",
                },
                stdin = true,
              }
            end,
          },
          typescript = {
            require("formatter.filetypes.typescript").prettier,
          },
        },
      })
    end,
  },
}
