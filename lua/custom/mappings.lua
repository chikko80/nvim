---@type MappingsTable
local M = {}
--local trouble = require("trouble.providers.telescope")
--

M.general = {
  n = {
    -- do nothing
    -- ["w"] = { "", "", opts = { remap = true } },
    -- ["b"] = { "", "", opts = { remap = true } },
    -- ["j"] = { "", "", opts = { remap = true } },
    -- ["k"] = { "", "", opts = { remap = true } },
    -- ["l"] = { "", "", opts = { remap = true } },
    -- ["h"] = { "", "", opts = { remap = true } },
    ["<CHAR-0x37>p"] = { "", "", opts = { remap = true } },
    ["<CHAR-0x37>o"] = { "", "", opts = { remap = true } },

    -- newline on enter
    ["<CR>"] = { "o<Esc>", "", opts = {} },
    ["<C-b>"] = { "<C-^>", "Go file back", opts = { remap = true } },

    -- ["<CHAR-0x37>r"] = { ":luafile ~/.config/nvim/init.lua<CR>", "", opts = {} }, not need in NVChad
    -- ["<CHAR-0x36>s"] = { ":wa <CR>", opts = { remap = true } },

    -- system copy, paste, mark
    ["<CHAR-0x37>a"] = { "ggVG", "", opts = { remap = true } },
    ["<CHAR-0x37>c"] = { '"+y', "", opts = { remap = true } },
    ["<CHAR-0x37>v"] = { '"+p', "", opts = { remap = true } },

    -- yank from clipboard
    ["<leader>P"] = { '"+p', "Paste from clipboard", { remap = true } },

    ["ZA"] = { "<cmd>wqa<CR>", "Save leave", opts = {} },

    -- (in NVChad core)
    ["<C-h>"] = { "<C-w>h", "", opts = {} },
    ["<C-j>"] = { "<C-w>j", "", opts = {} },
    ["<C-k>"] = { "<C-w>k", "", opts = {} },
    ["<C-l>"] = { "<C-w>l", "", opts = {} },

    -- split panes
    ["<leader>\\"] = { "<cmd>BetterWinSplitVertical<CR>", "Split Vertical", opts = {} },
    ["<leader><CR>"] = { "<cmd>BetterWinSplitHorizontal<CR>", "Split horizontal", opts = {} },
    -- ["<leader>\\"] = { "<C-w>v", "Split Vertical", opts = {} },
    -- ["<leader><CR>"] = { "<C-w>s", "Split horizontal", opts = {} },
    ["<leader>bsh"] = { "<C-w>s", "Split vertical", opts = {} },

    -- stay in line while J
    ["J"] = { "mzJ`z", "", opts = {} },
    ["K"] = { "mzK`z", "", opts = {} },

    -- stick mid while n
    ["N"] = { "Nzzzv", "", opts = {} },
    ["n"] = { "nzzzv", "", opts = {} },

    -- change word under cursor
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replace in file" },
    ["<leader>S"] = { '<cmd>lua require("spectre").open()<CR>', "Replace global wide" },

    -- change word under cursor - useless
    -- ["<leader>x"] = { "<CMD>!chmod +x %<CR>", "", opts = { silent = true } },
  },
  i = {
    -- pase from clipboard while in insert mode
    ["<CHAR-0x37>v"] = { '<Esc>"+pA', "", { remap = true } },
  },

  v = {

    -- substitute in visual mode
    ["<leader>s"] = { 'y:%s/\\V<c-r>"/<c-r>"/g<left><left>', "Testerino" },

    -- mark with visual mode and search for it
    ["//"] = { "y/\\V<C-R>=escape(@\",'/\')<CR><CR>", "Visual find" },

    -- copy paste clipboard
    ["<CHAR-0x37>c"] = { '"+y', "", { remap = true } },
    ["<leader>y"] = { '"+y', "", { remap = true } },
    ["<leader>P"] = { '"+p', "Paste from clipboard", { remap = true } },
    ["<CHAR-0x37>v"] = { '"+p', "", opts = { remap = true } },

    -- move lines
    ["J"] = { ":m '>+1<CR>gv=gv", "Move Line Up", {} },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move Line Down", {} },
    -- ["p"] = { '"_dP', "Paste no copy", {} },
  },

  x = {
    ["<leader>np"] = { '"_dP', "Paste no copy", {} },
    ["<CHAR-0x37>v"] = { '"+p', "", opts = { remap = true } },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["s"] = { "<CMD> Telescope live_grep <CR>", "Fuzzy infile" },
    ["<leader>p"] = { "<CMD> Telescope git_files <CR>", "git files" },
    -- ["<leader>o"] = { "<CMD> Telescope find_files <CR>", "find files " },
    ["<leader>o"] = { "<CMD> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>tc"] = { "<CMD> Telescope command_history <CR>", "Command History" },
    ["<leader>tq"] = { "<CMD> Telescope quickfix <CR>", "Quickfix" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<CMD> NvimTreeToggle <CR>", "NvimTreeToggle" },

    -- focus
    -- ["<leader>e"] = { "<CMD> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<CHAR-0x37>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<CHAR-0x37>/"] = {
      "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },

  x = {
    ["<CHAR-0x37>/"] = {
      "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },

  i = {
    ["<CHAR-0x37>/"] = {
      "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.misc = {
  n = {
    ["<leader>U"] = { "<CMD>UndotreeToggle<CR>", "UndotreeToggle" },

    ["<leader>w"] = { "<CMD>w<CR>", "Save All Buffers" },
    ["<leader>nu"] = { "<CMD>NvChadUpdate<CR>", "Update" },

    ["<leader>g"] = { "<CMD>LazyGit<CR>", "LazyGit" },


    -- ["ZZ"] = { "<CMD>BetterWinRemoveGroup<CR>", "Remove Group" },
    ["<leader>bd"] = { "<CMD>BetterWinRemoveFromGroup<CR>", "Remove Buffer" },
    ["<leader>u"] = { "<CMD>BetterWinSelection<CR>", "find buffers" },

    ["<leader>bh"] = { "<CMD>BetterWinMoveLeft<CR>", "Move buffer left" },
    ["<leader>bl"] = { "<CMD>BetterWinMoveRight<CR>", "Move buffer right" },
    ["<leader>bk"] = { "<CMD>BetterWinMoveUp<CR>", "Move buffer up" },
    ["<leader>bj"] = { "<CMD>BetterWinMoveDown<CR>", "Move buffer down" },

    ["<leader>bc"] = { "<C-w>o", "Close other buffers" },

    -- TODO: make only on attach
    ["<leader>f"] = { "<CMD>lua vim.lsp.buf.format()<CR>", "Format file", {} },
    ["<leader>r"] = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename Code", {} },
    -- ["<leader>r"] = { "<CMD>Lspsaga rename ++project<CR>", "Rename Project Wide", {} }, -- ! broken
    ["gr"] = { "<CMD>Telescope lsp_references<CR>", "Go References", {} },
    ["gf"] = { "<CMD>Lspsaga lsp_finder<CR>", "" },
    ["gd"] = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Go Definition", {} },
    ["gD"] = { "<CMD>Lspsaga peek_definition<CR>", "Peek Definition", {} },
    ["<leader>d"] = { "<CMD>Lspsaga show_line_diagnostics<CR>", "Show Diagnostics", {} },
    ["<leader>dl"] = { "<CMD>ErrorLensTelescope<CR>", "Show Diagnostics List", {} },
    ["<leader>dt"] = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Show Diagnostics List", {} },
    ["<leader>dn"] = { "<CMD>Lspsaga diagnostic_jump_prev<CR>", "Jump Prev Diagnostic", {} },
    ["<leader>dp"] = { "<CMD>Lspsaga diagnostic_jump_next<CR>", "Jump Next Diagnostic", {} },
    ["<leader>ca"] = { "<CMD>Lspsaga code_action<CR>", "Code Action", {} },
    ["K"] = { "<CMD>Lspsaga hover_doc<CR>", "Hover Doc", {} },
    ["<leader>co"] = { "<CMD>Lspsaga outline<CR>", "Code Outline", {} },

    ["<leader>tt"] = {
      "<CMD>TodoTelescope<CR>",
      "Telescope Todo Comments",
    },
    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
    ["<leader>tz"] = {
      function(...)
        -- return require("trouble.providers.telescope").open_with_trouble(...)
      end,
      "testfunction",
    },
  },
}

return M

-- insert semicolon at the end of line and newline

-- lazy reload config

-- save file

-- yank into os clipboard & marking

-- paste from os clipboard

-- paste without destroy buffer

-- -- Full quit with ZA

-- -- setup commentary functionZ

-- navigate through windows

-- split panes

-- move lines in visual mode

-- leave cursor at line start when combining lines
-- stay in the middle of file while searching

-- replace word under cursor

-- make current file chmod +x

----------------------------- ----------------------------------

-- copy & paste & mark
-- vim.keymap.set('', '<CHAR-0x37>a', 'D-a', {remap = true})
-- vim.keymap.set('', '<CHAR-0x37>c', 'D-c', {remap = true})
-- vim.keymap.set('', '<CHAR-0x37>v', 'D-v', {remap = true})

-- -- Commenting
-- vim.keymap.set('', '<CHAR-0x37>/', 'D-/', {remap = true})

-- -- Save file
-- vim.keymap.set('n', '<CHAR-0x37>s', 'D-s', {remap = true})

-- -- Reload lua config
-- vim.keymap.set('n', '<CHAR-0x37>r', 'D-r', {remap = true})

-- -- Fuzzy Finder
-- vim.keymap.set('n', '<CHAR-0x37>p', 'D-p', {remap = true})

-- vim.keymap.set('n', '<CHAR-0x37>b', 'D-b', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>d', 'D-d', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>e', 'D-e', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>f', 'D-f', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>g', 'D-g', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>h', 'D-h', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>i', 'D-i', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>j', 'D-j', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>k', 'D-k', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>l', 'D-l', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>m', 'D-m', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>n', 'D-n', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>o', 'D-o', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>q', 'D-q', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>t', 'D-t', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>u', 'D-u', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>w', 'D-w', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>x', 'D-x', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>y', 'D-y', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>z', 'D-z', {remap = true})

-- vim.keymap.set('n', '<CHAR-0x37>1', 'D-1', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>2', 'D-2', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>3', 'D-3', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>4', 'D-4', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>5', 'D-5', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>6', 'D-6', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>7', 'D-7', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>8', 'D-8', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>9', 'D-9', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>0', 'D-0', {remap = true})

-- vim.keymap.set('n', '<CHAR-0x37>-', 'D--', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>=', 'D-=', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>[', 'D-[', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>]', 'D-]', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>;', 'D-;', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>\\', 'D-\\', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>\'', 'D-\'', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>,', 'D-,', {remap = true})
-- vim.keymap.set('n', '<CHAR-0x37>.', 'D-.', {remap = true})

-- -- Testings
-- vim.keymap.set('n', 'D--', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-=', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-[', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-]', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-;', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-\\', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-\'', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-,', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-.', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-/', 'o<Esc>k', {remap = true})

-- vim.keymap.set('n', 'D-0', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-1', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-2', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-3', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-4', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-5', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-6', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-7', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-8', 'o<Esc>k', {remap = true})
-- vim.keymap.set('n', 'D-9', 'o<Esc>k', {remap = true})
