local opt = vim.opt
local keymap = vim.keymap
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.scrolloff = 8
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true

-- Visual Blockmode goes beyond the end of the line
opt.virtualedit = "block"

-- disable nvim intro
opt.shortmess:append("sI")

--General keymaps
vim.g.mapleader = " "
keymap.set("n", ";", ":", {})
keymap.set("n", "<Esc>", ":noh <CR>")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<leader>y", ":+y", { desc = "Yank line to systemclipboard" })
keymap.set("n", "<leader>ya", ":% y+<CR>", { desc = "Yank all to system clipboard" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
keymap.set("n", "<leader>re", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename in buffer" })

opt.conceallevel = 1

-- Navigate vim panes better
keymap.set("n", "<c-k>", "<C-w>k")
keymap.set("n", "<c-j>", "<C-w>j")
keymap.set("n", "<c-h>", "<C-w>h")
keymap.set("n", "<c-l>", "<C-w>l")

local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

for name, icon in pairs(symbols) do
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("LaunchSnacksOnStartup", { clear = true }),
  callback = function()
    if vim.fn.argv(0) == "" then
      require("snacks.picker").files()
    end
  end,
})
