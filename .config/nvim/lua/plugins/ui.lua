return {
  --[[ 
  {
    -- https://github.com/RRethy/nvim-base16
    -- Preview base16: https://base16-fork.github.io
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("base16-tomorrow-night")
    end,
   },
 ]]
  {
    -- https://github.com/Mofiqul/vscode.nvim
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").load()
    end,
  },
  {
    -- https://github.com/folke/zen-mode.nvim
    "folke/zen-mode.nvim",
    config = true,
  },
  {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    -- https://github.com/nvim-lualine/lualine.nvim
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "vscode",
      },
    },
  },
  {
    -- https://github.com/nvimdev/dashboard-nvim
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },
  {
    -- https://github.com/nvim-tree/nvim-tree.lua
    -- Lazy loading is not recommended: https://github.com/folke/lazy.nvim#-installation
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup(vim.keymap.set("n", "<leader>\\", ":NvimTreeToggle<CR>"))
    end,
  },
  {
    -- https://github.com/chentoast/marks.nvim
    "chentoast/marks.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    --https://github.com/yaocccc/nvim-foldsign
    "yaocccc/nvim-foldsign",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    -- https://github.com/famiu/bufdelete.nvim
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
  },
  {
    -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next TODO comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous TODO comment",
      },
    },
  },
}
