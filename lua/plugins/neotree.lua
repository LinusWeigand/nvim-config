return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {})
		vim.keymap.set("n", "<leader>o", ":Neotree toggle<CR>", {})

		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree if it's the last window
			filesystem = {
				follow_current_file = true, -- Automatically navigate to the current file in the tree
				use_libuv_file_watcher = true, -- Use faster file watcher based on libuv
				enable_git_status = true,
				git_status_async = true,
			},
			window = {
				mappings = {
					["l"] = "open", -- Additional mapping for 'l' to open files and directories
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
					"filesystem",
					"buffers",
					"git_status",
					"diagnostics",
				},
			},
		})
	end,
}

