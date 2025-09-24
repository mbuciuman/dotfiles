-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    require("lazyvim.util").format({ force = true })
  end,
})
