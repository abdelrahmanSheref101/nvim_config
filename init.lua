-- Load and setup Lazy.nvim with plugin-per-file import
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Only config settings
require("config.options")
require("config.keymaps")

-- This loads all plugins from lua/plugins/*.lua
require("lazy").setup({ import = "plugins" })


-- to set the colorscheme
vim.cmd.colorscheme("onedark")

