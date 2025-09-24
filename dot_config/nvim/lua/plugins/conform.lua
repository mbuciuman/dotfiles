return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
      formatters = {
        dart_format = {
          command = "dart",
          args = { "format", "--output", "show", "--summary", "none", "-" },
          stdin = true,
        },
      },
    },
  },
}
