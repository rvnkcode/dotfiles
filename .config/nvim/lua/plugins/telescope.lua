return {
  {
    -- https://github.com/nvim-telescope/telescope.nvim
    -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "Telescope search(find) files" },
      { "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
      { "<leader>sb", "<cmd>Telescope buffers<CR>", desc = "Telescope search(find) buffers" },
      { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "Telescope search(find) help tags" },
      { "<leader>:", "<cmd>Telescope command_history<CR>", desc = "Telescope command History" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Telescope git commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Telescope git status" },
      { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Telescope search key maps" },
      { "<leader>sc", "<cmd>Telescope commands<CR>", desc = "Telescope search commands" },
    },
  },
  {
    -- https://github.com/crusj/bookmarks.nvim
    "crusj/bookmarks.nvim",
    keys = {
      { "<tab><tab>", desc = "Toggle bookmarks" },
    },
    branch = "main",
    dependencies = { "nvim-web-devicons" },
    config = function()
      require("bookmarks").setup()
      require("telescope").load_extension("bookmarks")
    end,
  },
}
