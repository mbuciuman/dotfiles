return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("flutter-tools").setup {
      flutter_path = "flutter", -- assumes flutter is in PATH
      widget_guides = { enabled = true },
      lsp = {
        color = { enabled = true },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
      },
    }
  end,
}
