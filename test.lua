-- this line contains overlapping diagnostics

local ns = vim.api.nvim_create_namespace "test_namespace"
vim.diagnostic.set(ns, 0, {
  {
    lnum = 0,
    col = 10,
    end_col = 40,
    severity = vim.diagnostic.severity.ERROR,
    message = "error",
  },
})

