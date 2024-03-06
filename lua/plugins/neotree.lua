return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {})
    vim.keymap.set("n", "<leader>o", ":Neotree toggle<CR>", {})

    require("neo-tree").setup({
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      filesystem = {
        follow_current_file = true,
        use_libuv_file_watcher = true,
        enable_git_status = true,
        git_status_async = true,
      },
      window = {
        mappings = {
          ["l"] = "open",  -- Additional mapping for 'l' to open files and directories
          ["h"] = "close_node", -- Additional mapping for 'l' to open files and directories
        },
      },
      git_status = {
        window = {
          mappings = {
            ["l"] = "open", -- Additional mapping for 'l' in Git status
          },
        },
      },
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = "" .. " File" },
          { source = "buffers", display_name = "" .. " Bufs" },
          { source = "git_status", display_name = "" .. " Git" },
          { source = "diagnostics", display_name = "裂" .. " Diagnostic" },

          default_component_configs = {
            indent = { padding = 0, indent_size = 1 },
            icon = {
              folder_closed = "",
              folder_open = "",
              folder_empty = "",
              default = "",
            },
            modified = { symbol = "" },
            git_status = {
              symbols = {
                added = "",
                deleted = "",
                modified = "",
                renamed = "➜",
                untracked = "★",
                ignored = "◌",
                unstaged = "✗",
                staged = "✓",
                conflict = "",
              },
            },
          },
        },
      },
    })
  end,
}
