require("config.lazy")

-- Set background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Clipboard settings
vim.o.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = 'CopyQ',
  copy = {
    ['+'] = {'copyq', 'add', '-'},
    ['*'] = {'copyq', 'add', '-'},
  },
  paste = {
    ['+'] = {'copyq', 'paste', '-'},
    ['*'] = {'copyq', 'paste', '-'},
  },
  cache_enabled = 1,
}
