-- https://github.com/folke/lazy.nvim
-- https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/plugins
return {
  {
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        -- https://github.com/williamboman/mason.nvim
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
      },
      {
        -- https://github.com/williamboman/mason-lspconfig.nvim
        "williamboman/mason-lspconfig.nvim",
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        opts = {
          ensure_installed = {
            "bashls",
            "biome",
            "cssls",
            "docker_compose_language_service",
            "dockerls",
            "eslint",
            "html",
            "jsonls",
            "lua_ls",
            "marksman",
            "prismals",
            "rust_analyzer",
            "stylelint_lsp",
            "svelte",
            "tailwindcss",
            "taplo", -- TOML
            "tsserver",
            "lemminx", -- XML
            "yamlls",
          },
        },
      },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local lspconfig = require("lspconfig")
      lspconfig.bashls.setup({})
      lspconfig.biome.setup({})
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.docker_compose_language_service.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.eslint.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
      -- https://github.com/neovim/neovim/issues/21686
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim",
                "require",
              },
            },
          },
        },
      })
      lspconfig.marksman.setup({})
      lspconfig.prismals.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.stylelint_lsp.setup({})
      lspconfig.svelte.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.taplo.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.lemminx.setup({})
      lspconfig.yamlls.setup({})
    end,
    keys = {
      {
        "<leader>e",
        vim.diagnostic.open_float,
        desc = "LSP Diagnostic open float",
      },
      {
        "[d",
        vim.diagnostic.goto_prev,
        desc = "LSP Diagnostic go to prev",
      },
      {
        "]d",
        vim.diagnostic.goto_next,
        desc = "LSP Diagnostic go to next",
      },
      {
        "<leader>q",
        vim.diagnostic.setloclist,
        desc = "LSP Diagnostic list",
      },
      { "gD", vim.lsp.buf.declaration, desc = "LSP Declaration" },
      { "gd", vim.lsp.buf.definition, desc = "LSP Definition" },
      { "K", vim.lsp.buf.hover, desc = "LSP Hover" },
      { "gi", vim.lsp.buf.implementation, desc = "LSP implementation" },
      {
        "<C-k>",
        vim.lsp.buf.signature_help,
        desc = "LSP signature help",
      },
      {
        "<leader>wa",
        vim.lsp.buf.add_workspace_folder,
        desc = "LSP Add workspace folder",
      },
      {
        "<leader>wr",
        vim.lsp.buf.remove_workspace_folder,
        desc = "LSP Remove workspace folder",
      },
      {
        "<leader>wl",
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = "LSP Print workspace list",
      },
      {
        "<leader>D",
        vim.lsp.buf.type_definition,
        desc = "LSP Type definition",
      },
      { "<leader>rn", vim.lsp.buf.rename, desc = "LSP Rename" },
      { "gr", vim.lsp.buf.references, desc = "LSP References" },
      {
        "<leader>f",
        function()
          vim.lsp.buf.format({ async = true })
        end,
        desc = "LSP Format buffer",
      },
      {
        "<leader>ca",
        vim.lsp.buf.code_action,
        mode = { "n", "v" },
        desc = "LSP Code action",
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    -- https://github.com/L3MON4D3/LuaSnip#add-snippets
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    event = "InsertEnter",
  },
  {
    -- https://github.com/hrsh7th/nvim-cmp/
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    -- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local servers = {
        "bashls",
        "biome",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "prismals",
        "rust_analyzer",
        "sqlls",
        "stylelint_lsp",
        "svelte",
        "tailwindcss",
        "taplo",
        "tsserver",
        "lemminx",
        "yamlls",
      }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- up
          ["<C-d>"] = cmp.mapping.scroll_docs(4), -- down
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- NOTE: optional: tailwindcss completion
      cmp.config.formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      }
    end,
  },
  {
    -- NOTE: optional: https://github.com/roobert/tailwindcss-colorizer-cmp.nvim
    "roobert/tailwindcss-colorizer-cmp.nvim",
    event = "InsertEnter",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
}
