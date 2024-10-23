return {
	"akinsho/toggleterm.nvim",
	build = ":ToggleTerm",
	cmd = { "ToggleTerm", "TermExec" },
	lazy = false,
	opts = {
		size = 10,
		open_mapping = [[<F7>]], -- This binds the F7 key to open ToggleTerm
		shading_factor = 2,
		direction = "float",
		float_opts = { border = "curved", highlights = { border = "Normal", background = "Normal" } },
	},
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 10,
			open_mapping = [[<F7>]],
			shading_factor = 2,
			direction = "float",
			float_opts = { border = "curved", highlights = { border = "Normal", background = "Normal" } },
		})

		-- Keybindings for specific terminal IDs
		vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>1ToggleTerm<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>2", "<cmd>2ToggleTerm<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>3", "<cmd>3ToggleTerm<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>4", "<cmd>4ToggleTerm<CR>", { noremap = true, silent = true })
	end,
}
