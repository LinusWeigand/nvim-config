return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- JS, TS, TSX, JSX, CSS, HTML, YAML, etc.
        null_ls.builtins.formatting.prettier,

        -- Rust
        null_ls.builtins.formatting.rustfmt,

        -- Terraform
        null_ls.builtins.formatting.terraform_fmt,

        -- Bash
        null_ls.builtins.formatting.shfmt,

        -- ESLint for JS, TS diagnostics
        null_ls.builtins.diagnostics.eslint_d,
      },
      -- Format on save setup
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })  -- Update this to use `vim.lsp.buf.format()`
            end,
          })
        end
      end,
    })

    -- Set a keybinding for manual formatting
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

