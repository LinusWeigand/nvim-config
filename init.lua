
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("set")
require("lazy").setup("plugins")


-- we are going to configure my costum nvim config. This you need to remember:
-- I use lazy.nvim for plugin management. Mason for package management. this is my init.lua:
--we are going to configure my costum nvim config. This you need to remember:
--I use lazy.nvim for plugin management. Mason for package management. plugins are alpha-nvim, nvim-web.devicons, , catppuccin, cmp-nvim-lsp, cmp_luasnip, friendly-snippets,  nvim-cmp, lazygit, plenary, mason, mason-lspconfig, nvim-lspconfig, lualine, neo-tree, nui, none-ls, telescope, toggleterm, treesitter. Before we start please summerize what each of these plugins do. 


local function openAlphaIfDirectoryArg()
    -- Check if Neovim was started with a directory argument
    if #vim.fn.argv() == 1 and vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
        -- Require and setup alpha on startup if condition is met
        vim.cmd([[Alpha]])
    end
end

-- Call the function after Neovim has finished initializing
vim.api.nvim_create_autocmd("VimEnter", {callback = openAlphaIfDirectoryArg})
