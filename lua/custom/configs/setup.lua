
local function lsp_keymaps(bufnr)
    local opts = { buffer = bufnr, remap = false }
    -- format
    vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")

    -- rename
    vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename ++project<CR>", opts) -- ! broken

    -- show references
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
    -- vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- ! broken

    -- go definition
    vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
    vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)       -- see definition and make edits in window

    -- diagnostics
    -- vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)        -- diagnostics list
    vim.keymap.set("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    vim.keymap.set("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

    -- code actions
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)            -- show documentation for what is under cursor

    vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outline<CR>", opts)     -- see outline on right hand side
end

local function setup_on_attach(client, bufnr)
    print("Get attached")
    lsp_keymaps(bufnr)
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
        }
    })
end

return {
    setup_on_attach = setup_on_attach
}
