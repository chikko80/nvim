-- local function lsp_keymaps()
--   -- format
--   vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", "Format file")
--
--   -- rename
--   vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
--   vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename ++project<CR>") -- ! broken
--
--   -- show references
--   vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
--   vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>") -- ! broken
--
--   -- go definition
--   vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
--   vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>")
--   vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>")
--   vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>")
--   vim.keymap.set("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
--   vim.keymap.set("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_next<CR>")
--   vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
--   vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
--   vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outline<CR>")
-- end

local function setup_on_attach(client)
  print "Attaching Error Lens"
  -- lsp_keymaps()
  require("error-lens").setup(client, {
    colors = {
      error_fg = "#FF6363", -- diagnostic font color
      error_bg = "#4B252C", -- diagnostic line color
      warn_fg = "#FA973A",
      warn_bg = "#403733",
      info_fg = "#FA973A",
      info_bg = "#403733",
      hint_fg = "#FA973A",
      hint_bg = "#403733",
    },
  })
end

return {
  setup_on_attach = setup_on_attach,
}
