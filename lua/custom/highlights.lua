-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M


-- require("onedarkpro").setup({
--   highlights = {
--
--     ["@lsp.type.method"] = { fg = "#61AFEF" },
--     ["@lsp.typemod.method"] = { fg = "#61AFEF" },
--
--     ["@lsp.type.variable"] = { fg = "#B1B8C4" },
--     ["@lsp.type.generic"] = { fg = "#B1B8C4" },
--     ["@lsp.type.parameter"] = { fg = "#D19A66" },
--
--     ["@lsp.type.selfKeyword"] = { fg = "#C678DD" },
--     ["@lsp.type.selfTypeKeyword"] = { fg = "#C678DD" },
--     ["@lsp.type.formatSpecifier"] = { fg = "#C678DD" },
--
--     ["@lsp.type.struct"] = { fg = "#E5C07B" },
--     ["@lsp.type.typeAlias"] = { fg = "#E5C07B" },
--     ["@lsp.type.property"] = { fg = "#D5B3FF" },
--     ["@lsp.type.interface"] = { fg = "#2ACFAB" },
--
--     ["@lsp.type.macro"] = { fg = "#D19A66" },
--     ["@lsp.mod.constant"] = { fg = "#D19A66" },
--     ["@lsp.typemod.variable.constant"] = { fg = "#D19A66" },
--
--     CursorLine = { bg = "#3A3F4B"},
--     NvimTreeRootFolder = { fg = "#8f99b3"},
--     NvimTreeRootFolderHalloMarioTollTest = { fg = "#8f99b3"},
--     NvimTreeRootFolderMarioTollTest = { fg = "#8f99b3"},
--     NvimTreeOpenedFolderName = { fg = "#8f99b3"},
--     NvimTreeFolderIcon = { fg = "#8f99b3"},
--     Search = { bg = "#3A3F4b"},
--     IncSearch = { fg = "#ACBDE6", bg = "#3A3F4b"},
--
--   },
--   styles = {
--     comments = "italic",
--   },
--   filetypes = {
--    rust = false,
--   }
--
-- })
--
-- vim.cmd("colorscheme onedark")
