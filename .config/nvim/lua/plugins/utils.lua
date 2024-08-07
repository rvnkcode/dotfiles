return {
  {
    -- https://github.com/windwp/nvim-autopairs
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    -- https://github.com/folke/which-key.nvim
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    -- https://github.com/akinsho/toggleterm.nvim
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm" },
    keys = {
      { "<leader>T", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
      { "<ESC>", mode = { "t" }, "<C-\\><C-n>", desc = "Exit terminal mode" },
    },
    config = true,
  },
  {
    -- https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Gitsigns-next hunk")
        map("n", "[h", gs.prev_hunk, "Gitsigns-prev hunk")
        map("n", "<leader>hs", gs.stage_hunk, "Gitsigns-stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Gitsigns-reset hunk")
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Gitsigns-selected stage hunk")
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Gitsigns-selected reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Gitsigns-stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Gitsigns-undo stage hunk")
        map("n", "<leader>hR", gs.reset_buffer, "Gitsigns-reset buffer")
        map("n", "<leader>hp", gs.preview_hunk, "Gitsigns-preview hunk")
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Gitsigns-blame line")
        map("n", "<leader>tb", gs.toggle_current_line_blame, "Gitsigns-toggle current line blame")
        map("n", "<leader>hd", gs.diffthis, "Gitsigns-diff this")
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Gitsigns-diff this(~)")
        map("n", "<leader>td", gs.toggle_deleted, "Gitsigns-toggle deleted")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    },
  },
  {
    -- https://github.com/kylechui/nvim-surround
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
  {
    -- https://github.com/github/copilot.vim
    "github/copilot.vim",
    event = "VeryLazy",
  },
  {
    -- https://github.com/iamcco/markdown-preview.nvim
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_auto_close = 0
    end,
  },
}
