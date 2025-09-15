return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- Dart LSP is set up automatically by flutter-tools,
    -- but you can add more servers here if needed.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Example: Lua LSP for editing Neovim config
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    }
  end,
}
