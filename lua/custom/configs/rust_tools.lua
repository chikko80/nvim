require("rust-tools").setup {
  server = {
    on_attach = function(_, _)
      -- print "Attaching Rust Tools"
      -- lsp_setup.setup_on_attach(client)
      --  TODO: keymaps

      -- local group = vim.api.nvim_create_augroup("RustAnalyzer", {})
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = group,
      --   pattern = "<buffer>",
      --   command = "rust-analyzer",
      --   desc = "Run rust-analyzer on save",
      -- })
    end,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        -- checkOnSave = {
        --     command = "clippy",
        -- }
        -- assist = {
        --   importEnforceGranularity = true,
        --   importPrefix = "crate",
        -- },
        -- cargo = {
        --   allFeatures = true,
        -- },
        -- checkOnSave = {
        --   command = "clippy",
        -- },
        -- inlayHints = { locationLinks = false },
        -- diagnostics = {
        --   enable = true,
        --   experimental = {
        --     enable = true,
        --   },
        -- },
      },
    },
  },
}
