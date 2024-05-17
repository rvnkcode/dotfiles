-- ======================================================= Namespace
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local keymap = vim.keymap
local opt = vim.opt

g.mapleader = " "

-- ======================================================= Options
-- https://neovim.io/doc/user/options.html#option-summary
if fn.has("mac") == 1 then
  cmd("language en_US")
end
opt.autowrite = true
opt.cindent = true
opt.clipboard = "unnamedplus"
opt.colorcolumn = "80"
opt.completeopt = { "menu", "menuone", "preview", "noinsert", "noselect" }
opt.cursorline = true
opt.diffopt:append("vertical")
opt.expandtab = true
opt.foldenable = false
-- opt.foldmethod = "syntax"
opt.ignorecase = true
opt.langmap = {
  "ㅁa",
  "ㅠb",
  "ㅊc",
  "ㅇd",
  "ㄷe",
  "ㄹf",
  "ㅎg",
  "ㅗh",
  "ㅑi",
  "ㅓj",
  "ㅏk",
  "ㅣl",
  "ㅡm",
  "ㅜn",
  "ㅐo",
  "ㅔp",
  "ㅂq",
  "ㄱr",
  "ㄴs",
  "ㅅt",
  "ㅕu",
  "ㅍv",
  "ㅈw",
  "ㅌx",
  "ㅛy",
  "ㅋz",
}
opt.lazyredraw = true
opt.list = true
opt.listchars:append("eol:↲")
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.shiftround = true
opt.shiftwidth = 4
opt.showmatch = true
opt.smartcase = true
opt.softtabstop = 4
--[[ if not g.vscode then
  opt.spell = true
  opt.spelllang = "en_us"
end ]]
opt.splitbelow = true
opt.splitright = true
opt.switchbuf = "useopen"
opt.termguicolors = true
opt.title = true
opt.undofile = true
opt.wildignorecase = true
opt.wrap = false

-- Restore the last edited cursor position
cmd([[au BufReadPost *
\ if line("'\'") > 0 && line("'\'") <= line("$") |
\	exe "norm g`\"" |
\endif]])

-- Customize indentation Astro, c++, CSS, HTML, JS, JSX, JSON, Lua, Markdown TS, TSX, XML, YAML
cmd([[autocmd FileType astro setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd Filetype css setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd Filetype html setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd Filetype javascriptreact setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd FileType json setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd FileType lua setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd Filetype markdown setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd Filetype typescript setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd Filetype typescriptreact setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd FileType xml setlocal shiftwidth=2 softtabstop=2]])
cmd([[autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2]])

-- Clipboard configuration
-- https://github.com/search?q=g.clipboard+wsl+language%3ALua&type=code
-- TODO: Install wcopy: https://github.com/memoryInject/wsl-clipboard
local function is_wsl()
  local version_file = io.open("/proc/version", "rb")
  if version_file ~= nil and string.find(version_file:read("*a"), "microsoft") then
    version_file:close()
    return true
  end
  return false
end

if is_wsl() then
  vim.g.clipboard = {
    name = "wsl-clipboard",
    copy = {
      ["+"] = "wcopy",
      ["*"] = "wcopy",
    },
    paste = {
      ["+"] = "wpaste",
      ["*"] = "wpaste",
    },
    cache_enabled = true,
  }
elseif vim.env.WAYLAND_DISPLAY then
  vim.g.clipboard = {
    name = "WL-Clipboard with ^M Trim",
    copy = {
      ["+"] = "wl-copy --foreground --type text/plain",
      ["*"] = "wl-copy --foreground --type text/plain --primary",
    },
    paste = {
      ["+"] = function()
        return vim.fn.systemlist('wl-paste --no-newline | tr -d "\r"', "", 1)
      end,
      ["*"] = function()
        return vim.fn.systemlist('wl-paste --no-newline --primary | tr -d "\r"', "", 1)
      end,
    },
    cache_enabled = 1,
  }
end

-- ======================================================= Keymap
keymap.set("n", "<leader>v", ":e $MYVIMRC<CR>")
keymap.set("n", "<leader>e", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

-- ======================================================= Lazy nvim (plugin)
-- https://github.com/folke/lazy.nvim#-installation
if not g.vscode then
  local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  opt.rtp:prepend(lazypath)

  require("lazy").setup({
    import = "plugins",
  })
end
