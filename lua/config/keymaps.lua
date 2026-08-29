-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Redimensionar janelas com Option + HJKL
vim.opt.relativenumber = true

local map = vim.keymap.set
map("n", "<M-l>", ":vertical resize +2<CR>", { desc = "Aumentar largura" })
map("n", "<M-h>", ":vertical resize -2<CR>", { desc = "Diminuir largura" })
map("n", "<M-k>", ":resize +2<CR>", { desc = "Aumentar altura" })
map("n", "<M-j>", ":resize -2<CR>", { desc = "Diminuir altura" })
map("n", "<M-=>", "<C-w>=", { desc = "Igualar tamanho das janelas" })
map("n", "<leader>q", ":bd<CR>", { desc = "Fechar buffer" })

-- Format manual
map("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

-- Jdtls Keymaps
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename variable" })
-- map("v", "<leader>em", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = "Extract Method" })
map("v", "<leader>em", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", false)
  require("jdtls").extract_method(true)
  vim.defer_fn(function()
    vim.lsp.buf.rename()
  end, 300)
end, { desc = "Extract Method" })

map("v", "<leader>ev", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", false)
  require("jdtls").extract_variable(true)
  vim.defer_fn(function()
    vim.lsp.buf.rename()
  end, 300)
end, { desc = "Extract Method" })

map("v", "<leader>gg", function()
  vim.lsp.buf.code_action()
end, { desc = "Generate code" })
