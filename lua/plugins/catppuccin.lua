return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- Set up Catppuccin with transparent background
    require("catppuccin").setup({
      transparent_background = true,  -- Enable transparency
    })

    -- Apply the colorscheme
    vim.cmd.colorscheme "catppuccin"

    -- Additional highlights to ensure full transparency
    vim.cmd("highlight Normal guibg=none")
    vim.cmd("highlight NonText guibg=none")
  end
}
