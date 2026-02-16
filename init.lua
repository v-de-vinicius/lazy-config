-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Habilita o autoread nativo
vim.opt.autoread = true

-- Força o Neovim a checar mudanças sempre que você focar na janela ou entrar num buffer
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})
