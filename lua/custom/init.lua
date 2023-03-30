local autocmd = vim.api.nvim_create_autocmd

vim.opt.nu = true

vim.opt.relativenumber = true

vim.opt.clipboard=""

vim.opt.timeoutlen = 400

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- direction where we split panes
vim.o.splitbelow = true
vim.o.splitright = true

vim.opt.termguicolors = true

vim.o.switchbuf = vim.o.switchbuf .. ",uselast"


-- save file on buf change or leave
vim.cmd([[
  augroup AutoSaveBuffer
    autocmd!
    autocmd BufLeave * if &modified | silent! write | endif
    autocmd VimLeave * if &modified | silent! write | endif
  augroup END
]])

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}
    augroup END
]]

-- save file on buf change or leave
autocmd("BufEnter",
{ callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" } end, })


-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})


-- TODO 
-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
--   pattern = 'NvimTree*',
--   callback = function()
--   local view = require('nvim-tree.view')
--   local is_visible = view.is_visible()

--   local api = require('nvim-tree.api')
--   if not is_visible then
--     api.tree.open()
--   end
--   end,
-- })
