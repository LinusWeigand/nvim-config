-- Disable or customize diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", numhl = "" })

-- Continue with your existing LSP config
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Custom handler to filter out warnings and hints
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					virtual_text = {
						spacing = 4,
						severity = {
							min = vim.diagnostic.severity.ERROR,
						},
					},
					update_in_insert = false,
				})

			vim.keymap.set("n", "<leader>w", vim.diagnostic.open_float, { noremap = true, silent = true })

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})


			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							enable = false, -- Disable all diagnostics from rust-analyzer
						},
						formatting = {
							enable = false, -- Disable rust-analyzer's formatting if using rustfmt from null-ls
						},
					},
				},

        on_attach = function(_, bufnr)
          -- Key mappings for jumping to definitions and references
          local opts = { noremap = true, silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
          vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
          -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
          -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
