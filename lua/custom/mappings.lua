---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<CHAR-0x37>p"] = { "", "", opts = { remap = true } },
    ["<CHAR-0x37>o"] = { "", "", opts = { remap = true } },
    ["<CR>"] = { "o<Esc>", "", opts = {} },
    ["<CHAR-0x37>r"] = { ":luafile ~/.config/nvim/init.lua<CR>", "", opts = {} },
    ["<CHAR-0x37>s"] = { "", "", opts = { remap = true } },
    ["<CHAR-0x36>s"] = { ":wa <CR>", opts = { remap = true } },
    ["<CHAR-0x37>a"] = { "ggVG", "", opts = { remap = true } },
    ["<CHAR-0x37>c"] = { '"+y', "", opts = { remap = true } },
    ["<CHAR-0x37>v"] = { '"+p', "", opts = { remap = true } },
    ["<leader>P"] = { '"+p', "", { remap = true } },
    ["ZA"] = { ":wqa<CR>", "", opts = {} },
    ["<C-h>"] = { "<C-w>h", "", opts = {} },
    ["<C-j>"] = { "<C-w>j", "", opts = {} },
    ["<C-k>"] = { "<C-w>k", "", opts = {} },
    ["<C-l>"] = { "<C-w>l", "", opts = {} },
    ["<C-\\>"] = { "<C-w>v", "", opts = {} },
    ["<C-CR>"] = { "<C-w>s", "", opts = {} },
    ["J"] = { "mzJ`z", "", opts = {} },
    ["n"] = { "nzzzv", "", opts = {} },
    ["N"] = { "Nzzzv", "", opts = {} },
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "", opts = {} },
    ["<leader>x"] = { "<cmd>!chmod +x %<CR>", "", opts = { silent = true } },
  },
  i = {
    ["<C-CR>"] = { "<C-o>A;<CR>", "", {} },
    ["<CHAR-0x37>v"] = { '<Esc>"+pA', "", { remap = true } },
  },

  v = {
    ["<CHAR-0x37>c"] = { '"+y', "", { remap = true } },
    ["<leader>y"] = { '"+y', "", { remap = true } },
    ["<leader>P"] = { '"+p', "", { remap = true } },
    ["<leader>np"] = { '"_dP', "", {} },
    ["J"] = { ":m '>+1<CR>gv=gv", "", {} },
    ["K"] = { ":m '<-2<CR>gv=gv", "", {} },
  },

  x = {
    ["<leader>np"] = { '"_dP', "", {} },
    ["<CHAR-0x37>/"] = { "gc", "", { remap = true } },
  },
}

M.telescope = {
  plugin = true,
    n = {
        ["s"] = { "<cmd> Telescope live_grep <CR>", "Fuzzy infile" },
        ["<leader>ff"] = { "<cmd> Telescope git_files <CR>", "git files" },
        ["<leader>fa"] = { "<cmd> Telescope find_files <CR>", "find files " },
        ["<leader>fA"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
        ["<leader>u"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "NvimTreeToggle" },

    -- -- focus
    -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
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
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}



M.misc = {
    n = {
        ["<leader>g"] = { "<cmd>LazyGit<CR>", "LazyGit" },
    }
}



return M

-- insert semicolon at the end of line and newline

-- lazy reload config

-- save file

-- yank into os clipboard & marking

-- paste from os clipboard

-- paste without destroy buffer

-- -- Full quit with ZA

-- -- setup commentary function

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
