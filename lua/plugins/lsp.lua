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
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = {
            spacing = 4,
            severity_limit = "Error", -- Only display errors, no warnings or hints
          },
          update_in_insert = false,
        }
      )
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
          },
        },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

